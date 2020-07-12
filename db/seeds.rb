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
