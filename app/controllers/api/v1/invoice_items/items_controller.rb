class Api::V1::InvoiceItems::ItemsController < ApplicationController

  respond_to :json, :html, :xml

  def show
    invoice_item = InvoiceItem.where(id: params[:id])
    item = Invoice.where(id: invoice_item.first.item_id)
    respond_with item

  end

end
