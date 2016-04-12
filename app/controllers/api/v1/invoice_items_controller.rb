class Api::V1::InvoiceItemsController < ApplicationController

  respond_to :json, :html, :xml

  def index
    respond_with InvoiceItem.all
  end

  def show
    @invoice_item = InvoiceItem.find(params[:id])
    respond_with @invoice_item
  end
end
