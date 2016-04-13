class Api::V1::Invoices::MerchantsController < ApplicationController

  respond_to :json

  def show
    invoice = Invoice.where(id: params[:id])
    merchant = Merchant.where(id: invoice.first.merchant_id).take
    respond_with merchant
  end
end
