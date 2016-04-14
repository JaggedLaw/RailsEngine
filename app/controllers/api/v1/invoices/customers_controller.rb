class Api::V1::Invoices::CustomersController < ApplicationController

  respond_to :json

  def index
  end

  def show
    invoice = Invoice.where(id: params[:id])
    customer = Customer.where(id: invoice.first.customer_id).take
    respond_with customer
  end
end
