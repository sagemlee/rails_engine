class Invoice < ApplicationRecord
    has_many :invoice_items, dependent: :destroy
    belongs_to :customer
    belongs_to :merchant
end