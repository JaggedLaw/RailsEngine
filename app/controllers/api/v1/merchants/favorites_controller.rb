class Api::V1::Merchants::FavoritesController < ApplicationController

  respond_to :json
  
  def show
    respond_with Merchant.favorite_customer(params)
  end
end
