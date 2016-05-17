class MessengerService
  attr_accessor :api_message, :user

  def handle_incoming_message(api_message)
    @api_message = api_message
    @user = load_user

    load_conversation_message
  end

  private

  def load_user
    fb_user = client.get_user(fb_id_param)

    User.find_or_create_by(
      fb_user.merge(fb_id: fb_id_param)
    )
  end

  def load_conversation_message
    convo = user.conversations.find_or_create_by(archived: false)
    msg = convo.messages.find_or_initialize_by(
      fb_id: fb_msg_id_param,
      question_id: payload_question_id,
      answer_option_id: payload_answer_option_id,
      text: message_text
    )

    msg.attachments = message_param['attachments'] if message_param
    msg.assign_question_id unless msg.question

    convo.archive! if msg.user_opts_out?

    if msg.save && !convo.archived? && convo.next_question != []
      client.send_message(response_params(user, convo.next_question))
    end

    return msg
  end

  def response_params(user, question)
    if question && question.buttons.any?
      {
        recipient: {
          id: user.fb_id,
        },
        message: {
          attachment: {
            type: "template",
            payload: {
              template_type: 'generic',
              elements: question.api_elements
            }
          }
        }
      }
    else
      {
        recipient: {
          id: user.fb_id
        },
        message: {
          text: question.prompt
        }
      }
    end
  end


  def payload_question_id
    payload['question_id'] if payload
  end

  def payload_answer_option_id
    payload['answer_option_id'] if payload
  end

  def payload
    postback && postback['payload'] ? JSON.parse(postback['payload']) : nil
  end

  def postback
    messaging[0]['postback'] if messaging
  end

  def message_text
    message_param['text'] if message_param
  end

  def message_param
    messaging[0]['message'] if messaging
  end

  def messaging
    api_message[0]['messaging']
  end

  def fb_id_param
    api_message[0]['messaging'][0]['sender']['id']
  end

  def fb_msg_id_param
    api_message[0]['id']
  end

  def client
    MessengerClient.new
  end
end
