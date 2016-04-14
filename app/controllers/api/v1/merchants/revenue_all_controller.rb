class Api::V1::Merchants::RevenueAllController < ApplicationController

  respond_to :json

  def show
    respond_with Merchant.all_revenue_by_date(params)
  end

end
