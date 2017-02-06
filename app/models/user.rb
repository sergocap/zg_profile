class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :omniauthable,
         :timeoutable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :identities, dependent: :destroy

  def after_database_authentication
    RedisUserConnector.set(id, info.to_a.flatten)
  end

  def info
    {}.tap do |ui|
      ui['name'] = name
      ui['surname'] = surname
      ui['patronymic'] = patronymic
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

  def self.find_for_oauth(auth)
    identity = Identity.find_for_oauth(auth)
    user = identity.user

    if user.nil?
      user = User.new(name: auth.info.name, confirmed_at: Time.now)
      user.save!(validate: false)
    end

    if identity.user != user
      identity.name = auth.info.name
      identity.image = auth.info.image
      identity.url = auth.info.urls.values_at('GitHub', 'Twitter', 'Facebook', 'Google', 'Vkontakte').compact[0] if auth.info.try(:urls)
      identity.user = user
      identity.save!
    end
    user
  end
end
