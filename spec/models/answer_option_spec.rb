require 'rails_helper'

RSpec.describe AnswerOption, type: :model do
  it { should validate_presence_of :text }
end
