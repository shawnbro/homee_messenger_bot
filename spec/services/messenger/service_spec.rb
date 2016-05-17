require 'rails_helper'

describe Messenger::Service, :vcr do
  subject { Messenger::Service.new }

  let(:message) do
    [{
      'id'=>'Vez5sGkYd7Cn9kb_GIAQQA',
      'time'=>1463017866040,
      'messaging'=>[{
        'sender'=>{
          'id'=>10207612792412206
        },
        'recipient'=>{
          'id'=>1027242174024465
        },
        'timestamp'=>1463017851371,
        'message'=>{
          'mid'=>'mid.1463017851119:030ad6389918eecb26',
          'seq'=>2, 'text'=>'hey there!'
        }
      }]
    }]
  end

  describe '#handle_incoming_message' do
    before { subject.handle_incoming_message(message) }

    context 'when it\'s a new user\'s first message' do
      let(:user) { User.find_by(fb_id: '10207612792412206') }

      it 'creates a conversation' do
        expect(user.conversations).not_to be_empty
      end
    end
  end
end
