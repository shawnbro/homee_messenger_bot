class Conversation < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :questions, through: :messages

  validates :user_id, presence: true

  scope :unarchived, -> { where(archived: false) }

  def next_question
    if answered_question_ids.any?
      Question.unanswered(answered_question_ids).first
    else
      Question.initial
    end
  end

  def archive!
    update(archived: true)
  end

  private

  def answered_question_ids
    questions.map(&:id)
  end
end
