require 'gravtastic'
class User < ApplicationRecord
  include Gravtastic
  devise :database_authenticatable, :registerable, :omniauthable,
         :timeoutable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :identities, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :roles
  has_one  :avatar, dependent: :destroy
  belongs_to :main_city

  delegate :url, to: :avatar, prefix: true, allow_nil: true

  def has_role? role_name
    roles.map {|role| role.value == role_name.to_s }.any?
  end

  def address_string
    [vk_country_title, vk_region_title, vk_city_title].compact.join(', ')
  end

  before_save  :set_main_city
  after_create :create_avatar
  after_save   :set_nearest_main_city
  has_gravatar secure: true, size: 150

  def set_main_city
    return unless [vk_country_title, vk_region_title, vk_city_title].all?
    result = Geocoder.search(address_string)[0]
    lat, long = result.data['geometry']['location'].map {|_, value| value}
    #solr
  end

  def after_database_authentication
    RedisUserConnector.set(id, info.to_a.flatten)
  end

  def info
    {}.tap do |ui|
      ui['name'] = name
      ui['surname'] = surname
      ui['patronymic'] = patronymic
      ui['avatar_url'] = avatar_url
      ui['email'] = email
      ui['sign_in_count'] = sign_in_count
      ui['last_sign_in_at'] = last_sign_in_at.to_s
      ui['created_at'] = created_at
      ui['timeout_in'] = timeout_in.seconds.to_s
    end
  end

  def redis_info
    RedisUserConnector.get(id)
  end

  def set_nearest_main_city
    #self.update_attribute(:main_city_id, res)
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    user = User.new if user.nil?

    if identity.user != user
      identity.name = auth.info.name
      identity.image = auth.info.image
      identity.url = auth.info.urls.values_at('GitHub', 'Twitter', 'Facebook', 'Google', 'Vkontakte').compact[0] if auth.info.try(:urls)
      identity.user = user
      identity.save!
    end
    user
  end

  def fullname
    [surname, name, patronymic].join(' ').squeeze(' ')
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      user.identities << (Identity.find_for_oauth(session['devise.oauth_data']) || [])
    end
  end
end
