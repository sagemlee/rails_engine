class Api::V1::Merchants::ItemsController < ApplicationController

    def index
      render json: ItemSerializer.new(Item.by_merchant(params[:merchant_id]))
    end

end