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
