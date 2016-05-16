class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :question
  belongs_to :answer_option

  def user
    conversation.user
  end
end
