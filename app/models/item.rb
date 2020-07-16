class Item < ApplicationRecord
    has_many :invoice_items, dependent: :destroy
    has_many :invoices, through: :invoice_items
    belongs_to :merchant

 def self.by_merchant(id)
  Item.joins(:merchant)
       .where('items.merchant_id =?', id)
 end 

    def self.find_merchant(id)
        Merchant.joins(:items)
                .where('items.id=?', id)
            
    end 
end
