class Merchant < ApplicationRecord
    has_many :items

    def self.name_search(input)
        Merchant.all.find_all do |merchant| 
            if merchant.name.downcase.include?("#{input[:name].downcase}") 
                merchant
            end 
        end
    end 
end