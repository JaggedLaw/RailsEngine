class Api::V1::Items::InvoiceItemsController < ApplicationController

  respond_to :json, :xml, :html

  def index
    invoice_items = InvoiceItem.where(item_id: params[:id]).flatten
    respond_with invoice_items
  end
end
