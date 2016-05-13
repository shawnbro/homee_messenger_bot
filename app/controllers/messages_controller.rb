class MessagesController < ApplicationController
  def create
    if MessengerService.new.handle_incoming_message(params[:entry])
      render nothing: true
    else
      render json: 'Error, something went wrong.'
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
