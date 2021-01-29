class DealersController < ApplicationController
  def update
    dealer = Dealer.find(1)
    dealer.wins = 0
    dealer.losses = 0

    dealer.save!
    render json: dealer
  end
end
