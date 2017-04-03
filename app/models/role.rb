class Role < ApplicationRecord
  belongs_to :user

  def self.list
    [:admin]
  end

  def self.diff_with_user(user)
    Role.list - user.roles.map(&:value).map(&:to_sym)
  end
end

# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  user_id    :uuid
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_roles_on_user_id  (user_id)
#
