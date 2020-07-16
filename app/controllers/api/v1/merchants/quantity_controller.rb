class Api::V1::Merchants::QuantityController < ApplicationController
 
    def show
        render json: MerchantSerializer.new(Merchant.most_sold(params))
    end 
end
