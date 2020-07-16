class Api::V1::Merchants::SearchController < ApplicationController

    def index
         render json: MerchantSerializer.new(Merchant.names_search(params))
    end

    def show
         render json: MerchantSerializer.new(Merchant.name_search(params))
    end

end