class MessagesController < ApplicationController
  def create
    @user = User.find_or_create_by(fb_id: fb_id_param)
    if @user
      @message = @user.messages.new(json_data: params[:entry])

      if @message.save
        render json: @message
      else
        render json: { error: 'Unable to create message' }
      end
    else
      render json: { error: 'No such user exists.' }
    end
  end

  def fb_auth
    if params['hub.verify_token'] == ENV['FB_API_VERIFY_TOKEN']
      render json: params['hub.challenge']
    else
      render json: 'Error, wrong validation token.'
    end
  end

  private

  def fb_id_param
    params[:entry][0][:messaging][0][:sender][:id]
  end
end
