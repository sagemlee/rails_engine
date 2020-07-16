class Api::V1::MerchantsController < ApplicationController


    def index
      render json: MerchantSerializer.new(Merchant.all)
    end

    def show
      render json: MerchantSerializer.new(Merchant.find(params[:id]))

    end

    def create
      hello = Merchant.create(merchant_params)
       render json: MerchantSerializer.new(hello)
    end

    def destroy
      target = Merchant.find(params[:id])
      bye = target.delete
        render json: MerchantSerializer.new(bye)
    end

    private

  def merchant_params
    params.require(:merchant).permit(:name)
  end
end