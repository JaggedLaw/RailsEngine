class Api::V1::Items::MerchantsController < ApplicationController

  respond_to :json

  def show
    item = Item.where(id: params[:id]).take
    respond_with Merchant.where(id: item[:merchant_id]).take
  end
end
