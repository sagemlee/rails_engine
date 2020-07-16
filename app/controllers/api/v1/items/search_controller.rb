class Api::V1::Items::SearchController < ApplicationController
  def index 
    render json: ItemSerializer.new(Item.names_search(params))
  end 

  def show
    render json: ItemSerializer.new(Item.name_search(params))
  end 
end 
