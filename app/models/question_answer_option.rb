class QuestionAnswerOption < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer_option

  validates :question_id, presence: true
  validates :answer_option_id, presence: true
end
