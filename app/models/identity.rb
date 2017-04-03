class Identity < ApplicationRecord
  belongs_to :user

  validates_presence_of   :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_for_oauth(auth)
    find_or_create_by(:uid => auth['uid'], :provider => auth['provider'] ) if auth
  end
end

# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  uid        :string
#  name       :string
#  image      :string
#  url        :string
#  provider   :string
#  user_id    :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_identities_on_user_id  (user_id)
#
