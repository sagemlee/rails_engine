class AddColumnstoItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :name, :string
    add_column :items, :description, :string
    add_column :items, :unit_price, :float
    remove_column :items, :customer_id
    remove_column :items, :status
    end
end