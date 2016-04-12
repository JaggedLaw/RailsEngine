class Api::V1::Invoices::InvoiceItemsController < ApplicationController

  respond_to :json, :html, :xml

  def index
    respond_with InvoiceItem.where(invoice_id: params[:id])
  end
end
