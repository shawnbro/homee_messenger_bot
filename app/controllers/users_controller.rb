class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    if user
      render json: user.api_object
    else
      render json: 'There is no user associated with that ID.'
    end
  end

  private

  def id_param
    params[:id]
  end
end
