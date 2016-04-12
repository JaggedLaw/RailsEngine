class Api::V1::TransactionsController < ApplicationController

  respond_to :json, :html, :xml

  def index
    respond_with Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
    respond_with @transaction
  end
end
