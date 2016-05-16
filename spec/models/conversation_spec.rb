require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it { should validate_presence_of :user_id }

  describe '#next_question' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:conversation) { FactoryGirl.create(:conversation, user: user) }

    let!(:second_question) { FactoryGirl.create(:question, prompt: 'How many Bedrooms?', ordering: 2) }
    let!(:initial_question) { FactoryGirl.create(:question, prompt: 'Do you want to take this survey?', ordering: 1) }

    context 'when no questions have been asked' do
      it 'returns the initial question' do
        expect(conversation.next_question).to eq initial_question
      end
    end

    context 'when user has answered the initial question' do
      let!(:message) { FactoryGirl.create(:message, question: initial_question, conversation: conversation) }
      it 'returns the first question which hasn\'t been answered yet' do
        expect(conversation.next_question).to eq second_question
      end
    end

    context 'when all questions have been answered' do
      before do
        [initial_question, second_question].each do |q|
          FactoryGirl.create(:message, conversation: conversation, question: q)
        end
      end
      it 'returns nil' do
        expect(conversation.next_question).to eq nil
      end
    end
  end
end
