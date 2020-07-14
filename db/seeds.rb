# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'


csv_text = File.read(Rails.root.join('app','data', 'customers.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = Customer.new
  t.first_name = row['first_name']
  t.last_name = row['last_name']
  t.created_at = row['created_at']
  t.updated_at = row['updated_at']
  t.save
end

puts "There are now #{Customer.count} rows in the customers table"

csv_text_invoice_items= File.read(Rails.root.join('app','data', 'invoice_items.csv'))
csv_invoice_items = CSV.parse(csv_text_invoice_items, :headers => true)
csv_invoice_items.each do |row|
  t = InvoiceItem.new
  t.item_id = row['item_id']
  t.invoice_id = row['invoice_id']
  t.quantity = row['quantity']
  t.unit_price = (row['unit_price'].to_f/100)
  t.created_at = row['created_at']
  t.updated_at = row['updated_at']
  t.save

end

puts "There are now #{InvoiceItem.count} rows in the InvoiceItems table"

csv_text_invoice = File.read(Rails.root.join('app','data', 'invoices.csv'))
csv_invoice = CSV.parse(csv_text_invoice, :headers => true)
csv_invoice.each do |row|
  t = Invoice.new
  t.customer_id = row['customer_id']
  t.merchant_id = row['merchant_id']
  t.status = row['status']
  t.created_at = row['created_at']
  t.updated_at = row['updated_at']
  t.save
end
puts "There are now #{Invoice.count} rows in the Invoices table"

csv_text_items = File.read(Rails.root.join('app','data', 'items.csv'))
csv_items = CSV.parse(csv_text_items, :headers => true)
csv_items.each do |row|
  t = Item.new
  t.name = row['name']
  t.merchant_id = row['merchant_id']
  t.description = row['description']
  t.unit_price= (row['unit_price'].to_f/100)
  t.created_at = row['created_at']
  t.updated_at = row['updated_at']
  t.save
end
puts "There are now #{Item.count} rows in the Items table"

csv_text_merchant = File.read(Rails.root.join('app','data', 'merchants.csv'))
csv_merchant = CSV.parse(csv_text_merchant, :headers => true)
csv_merchant.each do |row|
  t = Merchant.new
  t.name = row['name']
  t.created_at = row['created_at']
  t.updated_at = row['updated_at']
  t.save
end
puts "There are now #{Merchant.count} rows in the merchants table"

csv_text_transactions = File.read(Rails.root.join('app','data', 'transactions.csv'))
csv_transactions = CSV.parse(csv_text_transactions, :headers => true)
csv_transactions.each do |row|
  t = Transaction.new
  t.invoice_id = row['invoice_id']
  t.credit_card_number = row['credit_card_number']
  t.credit_card_expiration_date = row['credit_card_expiration_date']
  t.result = row['result']
  t.created_at = row['created_at']
  t.updated_at = row['updated_at']
  t.save
end
puts "There are now #{Transaction.count} rows in the transactions table"
