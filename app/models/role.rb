class Role < ApplicationRecord
  belongs_to :user

  def self.list
    [:admin]
  end

  def self.diff_with_user(user)
    Role.list - user.roles.map(&:value).map(&:to_sym)
  end
end
