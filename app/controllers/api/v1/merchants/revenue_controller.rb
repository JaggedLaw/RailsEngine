class Api::V1::Merchants::RevenueController < ApplicationController

  respond_to :json

  def show
    if params[:date]
      respond_with Merchant.merchant_revenue_by_date(params)
    else
      respond_with Merchant.merchant_revenue(params)
    end
  end

end
