class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :customer_id
      t.string :merchant_id
      t.string :status
      t.timestamps
    end
  end
end
