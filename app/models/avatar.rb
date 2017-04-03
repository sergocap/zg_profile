class Avatar < ApplicationRecord
  belongs_to :user
  belongs_to :identity
  before_create :normalize_identity

  validates_inclusion_of :identity, in: -> (avatar) { avatar.user.identities  }, :allow_nil => true

  def normalize_identity
    return true unless identity_id

    identity_id.to_i
  end

  def url
    identity ? identity.image : user.gravatar_url
  end
end

# == Schema Information
#
# Table name: avatars
#
#  id          :integer          not null, primary key
#  user_id     :uuid
#  identity_id :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_avatars_on_user_id  (user_id)
#
