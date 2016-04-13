class Api::V1::Merchants::SearchController < ApplicationController

  respond_to :json

  def index
    respond_with Merchant.where(merchant_params)
  end

  def show
    respond_with Merchant.where(merchant_params).take
  end

  private

    def merchant_params
      params.permit(:id, :name, :created_at, :updated_at)
    end

end
