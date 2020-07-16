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

    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer1.id, merchant_id: merchant2, status: "shipped")
    invoice3 = Invoice.create(customer_id: customer1.id, merchant_id: merchant3, status: "shipped")
    invoice4 = Invoice.create(customer_id: customer1.id, merchant_id: merchant3, status: "shipped")
    
    invoice_item1 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 1, unit_price: 10.00)
    invoice_item2 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice2.id, quantity: 2, unit_price: 11.00)
    invoice_item3 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice3.id, quantity: 3, unit_price: 12.00)
    invoice_item4 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice4.id, quantity: 4, unit_price: 13.00)

    transaction = Transaction.create(invoice_id: invoice1, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003", result: "success")
    transaction = Transaction.create(invoice_id: invoice2, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003", result: "success")
    transaction = Transaction.create(invoice_id: invoice3, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003", result: "success")
    transaction = Transaction.create(invoice_id: invoice4, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003", result: "success")

    get '/api/v1/merchants/most_revenue?quantity=2'

    json = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(json[:data].length).to eq(2)

    expect(json[:data][0][:attributes][:name]).to eq(merchant3.name)
    expect(json[:data][0][:id]).to eq(merchant3.id)

    expect(json[:data][2][:attributes][:name]).to eq(merchant2.name)
    expect(json[:data][2][:id]).to eq(merchant2.name)
  end 

    xit "can get merchants who have sold the most items" do 
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)
      merchant4 = create(:merchant)
    
      item1 = create(:item, unit_price: 1.00)
      item2 = create(:item, unit_price: 2.00)
      item3 = create(:item, unit_price: 3.00)
      item4 = create(:item, unit_price: 4.00)
      item5 = create(:item, unit_price: 5.00)
      
      customer1 = Customer.create(first_name:"Bob",last_name: "John")

      invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1, status: "shipped")
      invoice2 = Invoice.create(customer_id: customer1.id, merchant_id: merchant2, status: "shipped")
      invoice3 = Invoice.create(customer_id: customer1.id, merchant_id: merchant3, status: "shipped")
      invoice4 = Invoice.create(customer_id: customer1.id, merchant_id: merchant4, status: "shipped")
      invoice5 = Invoice.create(customer_id: customer1.id, merchant_id: merchant4, status: "shipped")

      
      invoice_item1 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 15, unit_price: 10.00)
      invoice_item2 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice2.id, quantity: 10, unit_price: 11.00)
      invoice_item3 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice3.id, quantity: 5, unit_price: 12.00)
      invoice_item4 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice4.id, quantity: 5, unit_price: 13.00)
      invoice_item4 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice5.id, quantity: 11, unit_price: 13.00)

      transaction = Transaction.create(invoice_id: invoice1, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003", result: "success")
      transaction = Transaction.create(invoice_id: invoice2, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003", result: "success")
      transaction = Transaction.create(invoice_id: invoice3, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003", result: "success")
      transaction = Transaction.create(invoice_id: invoice4, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003", result: "success")


      get '/api/v1/merchants/most_items?quantity=3'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data].length).to eq(3)

      expect(json[:data][0][:attributes][:name]).to eq(merchant4.name)
      expect(json[:data][0][:id]).to eq(merchant4.id)

      expect(json[:data][3][:attributes][:name]).to eq(merchant1.name)
      expect(json[:data][3][:id]).to eq(merchant1.id)

      expect(json[:data][7][:attributes][:name]).to eq(merchant2.name)
      expect(json[:data][7][:id]).to eq(merchant2.name)

    end 

    xit 'can get revenue between two dates' do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)
    
      item1 = create(:item, unit_price: 1.00)
      item2 = create(:item, unit_price: 2.00)
      item3 = create(:item, unit_price: 3.00)
      item4 = create(:item, unit_price: 4.00)

      customer1 = Customer.create(first_name:"Bob",last_name: "John")

      invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1, status: "shipped", created_at:2012-03-11)
      invoice2 = Invoice.create(customer_id: customer1.id, merchant_id: merchant2, status: "shipped", created_at:2012-03-11)
      invoice3 = Invoice.create(customer_id: customer1.id, merchant_id: merchant3, status: "shipped", created_at:2012-03-8)
      invoice4 = Invoice.create(customer_id: customer1.id, merchant_id: merchant3, status: "shipped", created_at:2012-03-15)
      
      invoice_item1 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 1, unit_price: 10.00)
      invoice_item2 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice2.id, quantity: 1, unit_price: 11.00)
      invoice_item3 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice3.id, quantity: 1, unit_price: 12.00)
      invoice_item4 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice4.id, quantity: 1, unit_price: 13.00)

      transaction = Transaction.create(invoice_id: invoice1, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003", result: "success")
      transaction = Transaction.create(invoice_id: invoice2, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003", result: "success")
      transaction = Transaction.create(invoice_id: invoice3, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003", result: "success")
      transaction = Transaction.create(invoice_id: invoice4, credit_card_number: "credit number1", credit_card_expiration_date: "01/02/2003", result: "success")

      get '/api/v1/revenue?start=2012-03-09&end=2012-03-24'

       json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:attributes][:revenue].to_f.round(2)).to eq(34.00)

    end 

end 