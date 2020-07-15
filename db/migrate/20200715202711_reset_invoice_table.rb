class ResetInvoiceTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :invoice_items 
    drop_table :invoices
    drop_table :items 
    drop_table :transactions
    create_table :items do |t|
      t.references :merchant, foreign_key: true
      t.string :name
      t.string :description
      t.float :unit_price
      t.timestamps
    end
    create_table :invoices do |t|
      t.references :customer, foreign_key: true
      t.references :merchant, foreign_key: true
      t.string :status
      t.timestamps
    end
    create_table :invoice_items do |t|
      t.references :item, foreign_key: true
      t.references :invoice, foreign_key: true
      t.integer :quantity
      t.float :unit_price
      t.timestamps
    end 
    create_table :transactions do |t|
      t.references :invoice, foreign_key: true
      t.string :credit_card_number
      t.date :credit_card_expiration_date
      t.string :result
      t.timestamps
    end
  end
end
