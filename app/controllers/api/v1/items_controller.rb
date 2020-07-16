class Api::V1::ItemsController < ApplicationController

  
    def index
      render json: ItemSerializer.new(Item.all)
    end

    def show
      render json: ItemSerializer.new(Item.find(params[:id]))

    end

    def create
      hello = Item.create(item: params)
       render json: ItemSerializer.new(hello)
    end

    def destroy
      target = Item.find(params[:id])
      bye = target.delete
        render json: ItemSerializer.new(bye)
    end

    private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end