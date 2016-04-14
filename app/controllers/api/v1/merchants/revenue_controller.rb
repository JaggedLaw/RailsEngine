class Api::V1::Merchants::RevenueController < ApplicationController

  respond_to :json

  def show
    respond_with Merchant.merchant_revenue(params)
  end

end
