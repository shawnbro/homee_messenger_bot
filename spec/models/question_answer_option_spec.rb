require 'rails_helper'

RSpec.describe QuestionAnswerOption, type: :model do
  it { should validate_presence_of :question_id }
  it { should validate_presence_of :answer_option_id }
end
