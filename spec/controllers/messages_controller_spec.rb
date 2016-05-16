require 'rails_helper'

describe MessagesController, :vcr do
  describe 'POST #create' do
    let(:params) do
      {
        'object'=>'page',
        'entry'=>[{
          'id'=>'Vez5sGkYd7Cn9kb_GIAQQA',
          'time'=>1463017866040,
          'messaging'=>[{
            'sender'=>{
              'id'=> 10207612792412206
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
        }],
        'controller'=>'messages',
        'action'=>'new'
      }
    end


    def do_create_action
      post :create, params
    end

    before { do_create_action }

    let(:message) { Message.last }

    it { is_expected.to respond_with(200) }

    context 'when a user has never sent a message before' do
      it 'creates a message that\'s associated with the the user\'s facebook id' do
        expect(Message.last.user.fb_id).to eq '10207612792412206'
      end

      it 'creates a conversation' do
        expect(message.conversation).not_to be_nil
      end
    end
  end
end
