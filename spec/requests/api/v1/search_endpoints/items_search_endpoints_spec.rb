require 'rails_helper'

describe "Items API" do
  it "can find a list of items that contain a fragment, case insensitive" do 
    item1 = create(:item, name:"harubalfoiwe")
    item2 = create(:item, name:"Dairy Queen")
    item3 = create(:item, name:"sjfueharu")
    
    get '/api/v1/items/find_all?name=haru'
    
    expect(response).to be_success

    json = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    names = json[:data].map do |item|
        item[:attributes][:name]
    end

    expect(names.sort).to eq([item1.name, item3.name])
  end 
end 