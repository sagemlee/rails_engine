class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items
  belongs_to :merchant
end
