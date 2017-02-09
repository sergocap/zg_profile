class Avatar < ApplicationRecord
  #attr_accessor :gravatar

  belongs_to :user
  belongs_to :identity

  def url
    #identity ? identity.image : user.gravatar_url
    identity.image
  end
end
