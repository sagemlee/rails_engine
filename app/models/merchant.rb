class Merchant < ApplicationRecord
    has_many :items
    has_many :invoices
    has_many :invoice_items, through: :invoices

    def self.names_search(input)
        Merchant.all.find_all do |merchant| 
            if merchant.name.downcase.include?("#{input[:name].downcase}") 
                merchant
            end 
        end
    end 

    def self.name_search(input)
        Merchant.all.find do |merchant| 
            if merchant.name.downcase.include?("#{input[:name].downcase}") 
                merchant
            end 
        end
    end 

    def self.most_revenue(info)    
        highest_revenue =  Merchant.select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS "revenue"').joins(invoices: [:invoice_items, :transactions]).where(transactions: {result: "success"}).group('merchants.id').order("revenue desc").limit(info[:quantity].to_i).to_a
       binding.pry
        highest_revenue
    end 

    def self.most_sold(info)
        highest_sellers = Merchant.select('merchants.*, SUM(invoice_items.quantity) AS "quantity"').joins(invoices: [:invoice_items, :transactions]).where(transactions: {result: "success"}).group('merchants.id').order("quantity desc").limit(info[:quantity].to_i).to_a
        highest_sellers
    end 

    def self.total_revenue(info)
        revenue = Merchant.select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS "quantity"').joins(invoices: [:invoice_items, :transactions]).where(invoices: {created_at: info[:start].to_date.beginning_of_day..info[:end].to_date.end_of_day}).group('merchants.id').to_a
    
        total = revenue.sum {|merchant| merchant.quantity}
        total
       # transactions: {result: "success"} and
    end 


end