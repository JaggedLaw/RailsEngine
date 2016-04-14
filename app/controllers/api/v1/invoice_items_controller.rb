class Api::V1::InvoiceItemsController < ApplicationController

  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def show
    @invoice_item = InvoiceItem.find(params[:id])
    render json: @invoice_item
  end
end
