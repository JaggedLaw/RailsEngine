class Api::V1::InvoicesController < ApplicationController

  respond_to :json, :html, :xml

  def index
    respond_with Invoice.all
  end
end
