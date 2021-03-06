class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :question
  belongs_to :answer_option

  validates :fb_id, presence: true
  validates :conversation_id, presence: true

  def assign_question_id
    return unless conversation.questions.count > 0
    if last_answered_question_ordering >= Question.max_ordering - 1
      conversation.archive!
    else
      self.question =
        Question.find_by_ordering(last_answered_question_ordering + 1)
    end
  end

  def user
    conversation.user
  end

  def user_opts_out?
    if question && question.ordering == 1 && answer_option.text == 'No'
      Messenger::Client.new.send_message(
        {
          recipient: {
            id: conversation.user.fb_id
        },
        message: {
          text: 'That is too bad.  Let me know if you change your mind.'
          }
        }
      )
      return true
    else
      return false
    end
  end

  private

  def last_answered_question_ordering
    answered_questions.max_ordering || 0
  end

  def answered_questions
    conversation.questions
  end
end
