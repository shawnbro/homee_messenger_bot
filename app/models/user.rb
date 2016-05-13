class User < ActiveRecord::Base
  has_many :conversations
  has_many :messages, through: :conversations
  has_many :unarchived_conversations, -> { unarchived }, class_name: 'Conversation'
  validates :fb_id, presence: true, uniqueness: true

  def current_conversation
    unarchived_conversations.first
  end
end
