class Api::V1::Invoices::MerchantsController < ApplicationController

  respond_to :json, :xml, :html

  def show
    invoice = Invoice.where(id: params[:id])
    merchant = Merchant.where(id: invoice.first.merchant_id)
    respond_with merchant
  end
end
