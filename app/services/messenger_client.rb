class MessengerClient
  include HTTParty
  base_uri 'https://graph.facebook.com/v2.6/me/messages'
  default_params access_token: ENV['FB_API_ACCESS_TOKEN']
  format :json
  headers 'Content-Type' => 'application/json'

  def send_message(user, question)
    post(message_params(user, question))
  end

  private

  def message_params(user, question)
    {
      recipient: {
        id: user.fb_id,
      },
      message: {
        attachment: {
          type: "template",
          payload: {
            template_type: "button",
            text: question[:text],
            buttons: question[:buttons]
          }
        }
      }
    }
  end

  def post(args)
    self.class.post("/", body: args.to_json)
  end
end
