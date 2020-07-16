require 'rails_helper'

describe "Merchants API" do
  it "sends a list of items" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true )
   expect(merchants[:data].count).to eq(3)

  end

  it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body, symbolize_names: true )
    expect(response).to be_successful
    expect(merchant[:data][:attributes][:id]).to eq(id)
  end

  it "can create a new merchant" do
    merchant_params = {name: "Walmart"}
    post "/api/v1/merchants", params: merchant_params

    merchant = Merchant.last
    expect(response).to be_successful
    expect(merchant.name).to eq(merchant_params[:name])
  end

  it "can delete merchant" do
    merchant_params = {name: "Walmart"}
    post "/api/v1/merchants", params:  merchant_params

    merchant = Merchant.last
    expect(response).to be_successful
    expect(merchant.name).to eq(merchant_params[:name])

    delete "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_success
    expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "can update an existing merchant" do
    id = create(:merchant).id
    previous_name = Merchant.last.name
    merchant_params = { name: "Harry's" }

    put "/api/v1/merchants/#{id}", params:  merchant_params
    merchant = Merchant.find_by(id: id)

    expect(response).to be_successful
    expect(merchant.name).to_not eq(previous_name)
    expect(merchant.name).to eq("Harry's")
  end

end