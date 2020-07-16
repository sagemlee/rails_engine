class Invoice < ApplicationRecord
    has_many :invoice_items, dependent: :destroy
    has_many :items, through: :invoice_items
    belongs_to :customer
    belongs_to :merchant
end