class Api::V1::MerchantsController < ApplicationController

  respond_to :json, :xml, :html

  def index
    @merchants = Merchant.all
    respond_with @merchants
  end

end
