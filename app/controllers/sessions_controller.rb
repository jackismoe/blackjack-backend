class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:player][:name])

    if user && user.authenticate(params[:player][:password])
      session[:user_id] = user.id
      render json: user
    end
  end

  def destroy
    session[:user_id] = 0
    render json: session
  end
end
