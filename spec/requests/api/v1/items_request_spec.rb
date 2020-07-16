require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true )
   expect(items[:data].count).to eq(3)

  end

  it "can get one item by its id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body, symbolize_names: true )
    expect(response).to be_successful
    expect(item[:data][:attributes][:id]).to eq(id)
  end

  it "can create a new item" do
    merchant = create(:merchant)
    item_params = { name: "Toothbrush", description: "Dental health is important", unit_price: 123.45, merchant_id: merchant.id }
    post "/api/v1/items", params: item_params
    item = Item.last
    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
  end

  it "can delete item" do
    merchant = create(:merchant)
    item_params = { name: "Toothbrush", description: "Dental health is important", unit_price: 123.45, merchant_id: merchant.id }

    post "/api/v1/items", params: item_params
    item = Item.last
    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_success
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

end