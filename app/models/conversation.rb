class Conversation < ActiveRecord::Base
  belongs_to :user
  has_many :messages

  validates :user_id, presence: true

  scope :unarchived, -> { where(archived: false) }

  def next_question
    {
      text: 'Do you want to take this survery?',
      buttons: [
        {
          title: 'Yes',
          type: 'postback',
          payload: { conversation_id: 1, question_id: 1, answer_id: 1 }.to_json
        },
        {
          title: 'No',
          type: 'postback',
          payload: { conversation_id: 1, question_id: 1, answer_id: 2 }.to_json
        }
      ]
    }
  end
end
