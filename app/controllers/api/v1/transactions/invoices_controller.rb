class Api::V1::Transactions::InvoicesController < ApplicationController

  respond_to :json

  def show
    transaction = Transaction.find(params[:id])
    invoice = Invoice.find_by(id: transaction.invoice_id)
    respond_with invoice
  end

end
