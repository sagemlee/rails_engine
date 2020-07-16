class Api::V1::Merchants::SearchController < ApplicationController

    def show
         render json: MerchantSerializer.new(Merchant.name_search(params))
    end

end