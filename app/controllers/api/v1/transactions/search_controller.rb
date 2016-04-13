class Api::V1::Transactions::SearchController < ApplicationController

  respond_to :json

  def show
    respond_with Transaction.where(transaction_params).take
  end

  def index
    respond_with Transaction.where(transaction_params)
  end

  private
    def transaction_params
      params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
    end

end
