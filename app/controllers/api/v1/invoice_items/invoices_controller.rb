class Api::V1::InvoiceItems::InvoicesController < ApplicationController

  respond_to :json, :xml, :html

  def show
    invoice_item = InvoiceItem.where(id: params[:id])
    invoice = Invoice.where(id: invoice_item.first.invoice_id).take
    respond_with invoice
  end
end
