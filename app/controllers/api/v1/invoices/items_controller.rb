class Api::V1::Invoices::ItemsController < ApplicationController

  respond_to :json

  def index
    invoice_items = InvoiceItem.where(invoice_id: params[:id])
    @items = Array.new
    invoice_items.each do |invoice_item|
      @items << Item.where(id: invoice_item.item_id)
    end
    respond_with @items.flatten
  end
end
