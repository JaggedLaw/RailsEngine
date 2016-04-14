class Api::V1::InvoiceItems::ItemsController < ApplicationController

  respond_to :json

  def show
    invoice_item = InvoiceItem.where(id: params[:id])
    item = Item.where(id: invoice_item.first.item_id).take
    respond_with item

  end

end
