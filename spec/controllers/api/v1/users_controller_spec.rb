require 'rails_helper'

describe Api::V1::UsersController do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:conversation) { user.conversations.create }
  let!(:message) { conversation.messages.create(text: 'Hi there.', fb_id: 12345) }

  describe 'GET #show' do
    before { get :show, { id: user.id } }

    it { is_expected.to respond_with(200) }

    it 'responds with a json User object including the conversations' do
      expect(JSON.parse(response.body)['conversations'][0]['messages'][0]['text']).to eq 'Hi there.'
    end
  end
end
