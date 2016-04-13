class Api::V1::Invoices::SearchController < ApplicationController

  respond_to :json

  def show
    respond_with Invoice.where(invoice_params).take
  end

  def index
    respond_with Invoice.where(invoice_params)
  end

  private
    def invoice_params
      params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
    end
end
