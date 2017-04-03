class Message < ApplicationRecord
  belongs_to :user
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  user_id    :uuid
#  subject    :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_messages_on_user_id  (user_id)
#
