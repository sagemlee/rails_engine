require 'rails_helper'

describe "Merchants API" do
  it "can get merchants with most revenue" do 
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)
   
    item1 = create(:item, unit_price: 1.00)
    item2 = create(:item, unit_price: 2.00)
    item3 = create(:item, unit_price: 3.00)
    item4 = create(:item, unit_price: 4.00)

    customer1 = Customer.create(first_name:"Bob",last_name: "John")

    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant_1, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer1.id, merchant_id: merchant_2, status: "shipped")
    invoice3 = Invoice.create(customer_id: customer1.id, merchant_id: merchant_3, status: "shipped")
    invoice4 = Invoice.create(customer_id: customer1.id, merchant_id: merchant_3, status: "shipped")
    
    invoice_item1 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 1, unit_price: 10.00)
    invoice_item2 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice2.id, quantity: 1, unit_price: 10.00)
    invoice_item3 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice3.id, quantity: 1, unit_price: 10.00)
    invoice_item4 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice4.id, quantity: 1, unit_price: 10.00)

    transaction = Transaction.create(invoice_id: invoice1, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003" result: "successful")
    transaction = Transaction.create(invoice_id: invoice2, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003" result: "successful")
    transaction = Transaction.create(invoice_id: invoice3, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003" result: "successful")
    transaction = Transaction.create(invoice_id: invoice4, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003" result: "successful")

    get '/api/v1/merchants/most_revenue?quantity=2'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(2)

    expect(json[:data][0][:attributes][:name]).to eq(merchant3.name)
    expect(json[:data][0][:id]).to eq(merchant3.id)

    expect(json[:data][2][:attributes][:name]).to eq(merchant2.name)
    expect(json[:data][2][:id]).to eq(merchant2.name)
  end 
end 