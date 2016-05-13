class MessagesController < ApplicationController
  def create
    if MessengerService.new.handle_incoming_message(params[:entry])
      render nothing: true
    else
      render json: { error: 'Unable to create message' }
    end
  end

  def fb_auth
    if params['hub.verify_token'] == ENV['FB_API_VERIFY_TOKEN']
      render json: params['hub.challenge']
    else
      render json: 'Error, wrong validation token.'
    end
  end
end
