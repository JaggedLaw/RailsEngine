class Api::V1::ItemsController < ApplicationController

  respond_to :json, :html, :xml

  def index
    respond_with Item.all
  end
end
