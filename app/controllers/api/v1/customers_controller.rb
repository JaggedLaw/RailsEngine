class Api::V1::CustomersController < ApplicationController

  respond_to :json, :html, :xml

  def index
    respond_with Customer.all
  end
end
