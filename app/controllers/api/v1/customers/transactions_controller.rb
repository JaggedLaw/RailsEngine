class Api::V1::Customers::TransactionsController < ApplicationController

  respond_to :json, :html, :xml

  def index
    invoices = Invoice.where(customer_id: params[:id])

    # Transaction.joins(:customer).where(customer_id: params[:id])
    @transactions = Array.new
    invoices.each do |invoice|
      @transactions << Transaction.find_by(invoice_id: invoice.id)
    end
    respond_with @transactions
  end
end
