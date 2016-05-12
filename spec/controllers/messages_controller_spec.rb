require 'rails_helper'

describe MessagesController do
  describe 'POST #create' do
    let(:user) { FactoryGirl.create(:user) }
    let(:params) do
      {
        'object'=>'page',
        'entry'=>[{
          'id'=>'Vez5sGkYd7Cn9kb_GIAQQA',
          'time'=>1463017866040,
          'messaging'=>[{
            'sender'=>{
              'id'=> user.fb_id
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
    it { is_expected.to respond_with(200) }

    context 'when a user has never sent a message before' do
      it 'creates a message that\'s associated with the the user\'s facebook id' do
        expect(user.messages.last.text).to eq 'hey there!'
      end
    end
  end
end
