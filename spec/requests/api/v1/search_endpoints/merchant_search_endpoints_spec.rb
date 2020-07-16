require 'rails_helper'

describe "Merchants API" do
  it "can find a list of merchants that contain a fragment, case insensitive" do
  merchant1 = create(:merchant, name: "Walmart")
  merchant2 = create(:merchant, name: "Target")
  merchant3 = create(:merchant, name: "Starbucks")
  merchant3 = create(:merchant, name: "King Soopers")
  
  expect(response).to be_success

  get "/api/v1/merchants/find_all?name=AR"
  
  names = json[:data].map do |merchant|
    merchant[:attributes][:name]
  end

  expect(names.sort).to eq(["Starbuck","Target","Walmart"])

  end 
end 