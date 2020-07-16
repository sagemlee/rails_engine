require 'rails_helper'

describe "Merchants API" do
  it "can find a list of merchants that contain a fragment, case insensitive" do
  merchant1 = create(:merchant, name: "Walmart")
  merchant2 = create(:merchant, name: "Target")
  merchant3 = create(:merchant, name: "Starbucks")
  merchant3 = create(:merchant, name: "King Soopers")
  
  
  get "/api/v1/merchants/find_all?name=AR"
  
  expect(response).to be_success

  json = JSON.parse(response.body, symbolize_names: true)
  names = json[:data].map do |merchant|
    merchant[:attributes][:name]
  end

  expect(names.sort).to eq(["Starbucks","Target","Walmart"])

  end 

  it "can find a merchants that contain a fragment, case insensitive" do
    merchant1 = create(:merchant, name: "Walmart")
    merchant2 = create(:merchant, name: "Target")
    merchant3 = create(:merchant, name: "Starbucks")
    merchant3 = create(:merchant, name: "King Soopers")
    
    
    get "/api/v1/merchants/find?name=AR"
    
    expect(response).to be_success

    json = JSON.parse(response.body, symbolize_names: true)

    name = json[:data][:attributes][:name].downcase

    expect(json[:data]).to be_a(Hash)
    expect(name).to include('ar')
  end 
end 