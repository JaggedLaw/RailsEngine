class Api::V1::Invoices::CustomersController < ApplicationController

  respond_to :json, :xml, :html

  def index
  end

  def show
    invoice = Invoice.where(id: params[:id])
    customer = Customer.where(id: invoice.first.customer_id)
    respond_with customer
  end
end
