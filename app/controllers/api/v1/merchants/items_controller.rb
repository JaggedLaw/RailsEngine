class Api::V1::Merchants::ItemsController < ApplicationController

  respond_to :html, :json, :xml

  def index
    respond_with Item.where(merchant_id: params[:id])
  end
end
