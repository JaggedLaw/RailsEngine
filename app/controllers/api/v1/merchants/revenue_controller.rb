class Api::V1::Merchants::RevenueController < ApplicationController

  respond_to :json

  def show
    response = Merchant.merchant_revenue(params)
  end

end
