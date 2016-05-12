class MessagesController < ApplicationController
  def create

  end

  def fb_auth
    if params['hub.verify_token'] == ENV['FB_API_VERIFY_TOKEN']
      render json: params['hub.challenge']
    else
      render json: 'Error, wrong validation token.'
    end
  end
end
