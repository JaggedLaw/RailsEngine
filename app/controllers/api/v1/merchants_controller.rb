class Api::V1::MerchantsController < ApplicationController

  #take out xml and html
  respond_to :json, :xml, :html

  def index
    @merchants = Merchant.all
    respond_with @merchants
  end

  def show
    @merchant = Merchant.find(params[:id])
    respond_with @merchant
  end

  #define find_all method here
  #other way is to create a search controller and do show and index instead of specific methods

end
