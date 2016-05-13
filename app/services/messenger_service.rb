class MessengerService
  def handle_incoming_message(api_message)
    user = User.find_or_create_by(fb_id: fb_id_param(api_message))
    convo = user.conversations.find_or_create_by(archived: false)

    convo.messages.create(json_data: api_message)

    client.send_message(user, convo.next_question)
  end

  private

  def fb_id_param(message)
    message[0]['messaging'][0]['sender']['id']
  end

  def client
    MessengerClient.new
  end
end
