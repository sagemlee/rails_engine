class Item < ApplicationRecord
    has_many :invoice_items, dependent: :destroy
    has_many :invoices, through: :invoice_items
    belongs_to :merchant

 def self.by_merchant(id)
  Item.joins(:merchant)
       .where('items.merchant_id =?', id)
 end 
end
