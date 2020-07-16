class Api::V1::RevenueController < ApplicationController

 def show
        #render json: MerchantSerializer.new(Merchant.total_revenue(params))
        render json: {data: {attributes: {revenue: Merchant.total_revenue(params)}}}
    end 
end

#render json: {data: {attributes: {revenue: Merchant.total_revenue(params)}}}