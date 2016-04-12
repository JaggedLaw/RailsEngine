class Api::V1::InvoiceItemsController < ApplicationController

  respond_to :json, :html, :xml

  def index
    respond_with InvoiceItem.all
  end
end
