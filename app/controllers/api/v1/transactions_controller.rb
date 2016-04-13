class Api::V1::TransactionsController < ApplicationController

  respond_to :json, :html, :xml

  def index
    respond_with Transaction.where(transaction_params)
  end

  def show
    @transaction = Transaction.find(params[:id])
    respond_with @transaction
  end

  private

    def transaction_params
      params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
    end
end
