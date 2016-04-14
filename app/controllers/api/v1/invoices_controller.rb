class Api::V1::InvoicesController < ApplicationController

  respond_to :json

  def index
    respond_with Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
    respond_with @invoice
  end
end
