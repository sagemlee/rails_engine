class ChangeColumnToReference < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoice_items, :item_id, :string
    add_column :invoice_items, :item_id, :integer, references: :items
  end
end
