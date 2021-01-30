class UsersController < ApplicationController
  def create
    user = User.create(username: params[:player][:name], password: params[:player][:password], wins: 0, losses: 0)
    session[:user_id] = user.id
    sessionStorage = {username: user.username, userId: session[:user_id]}
    render json: sessionStorage
  end

  def show
    user = User.find(params[:id])
    dealer = Dealer.find(1)

    game = [user, dealer]
    render json: game
  end

  def update
    user = User.find(params[:id])
    dealer = Dealer.find(1)
    
    if params[:winner] == 'dealer'
      user.losses += 1
      dealer.wins +=1
    elsif params[:winner] == user.username
      user.wins += 1
      dealer.losses += 1
    end

    user.save!
    dealer.save!

    game = [user, dealer]
    render json: game
  end
end
