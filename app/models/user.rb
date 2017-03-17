require 'gravtastic'
class User < ApplicationRecord
  include Gravtastic
  devise :database_authenticatable, :registerable, :omniauthable,
         :timeoutable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  belongs_to :city
  has_many :identities, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :roles
  has_one  :avatar, dependent: :destroy

  delegate :url, to: :avatar, prefix: true, allow_nil: true

  def has_role? role_name
    roles.map {|role| role.value == role_name.to_s }.any?
  end

  after_create :create_avatar
  has_gravatar secure: true, size: 150

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

  def self.new_with_session(params, session)
    super.tap do |user|
      user.identities << (Identity.find_for_oauth(session['devise.oauth_data']) || [])
    end
  end
end
