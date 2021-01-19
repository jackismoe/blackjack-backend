class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:player][:name])

    if user && user.authenticate(params[:player][:password])
      session[:user_id] = user.id
      render json: user
    end
  end
end
