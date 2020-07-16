class ChangeItemidToReference < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :invoice_items, :items
  end
end
