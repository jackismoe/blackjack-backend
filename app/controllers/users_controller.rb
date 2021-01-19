class UsersController < ApplicationController
  def create
    user = User.create(username: params[:player][:name], password: params[:player][:password])
    session[:user_id] = user.id
    render json: user
  end
end
