class Api::V1::Items::MerchantsController < ApplicationController

    def show
      render json: MerchantSerializer.new(Item.find_merchant(params[:item_id]).first)
    end

end