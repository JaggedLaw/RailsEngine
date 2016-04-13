class Api::V1::CustomersController < ApplicationController

  respond_to :json, :html, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end
end
