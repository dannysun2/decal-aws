class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :sku
      t.string :product_name
      t.decimal :price
      t.integer :order_id
      t.timestamps null: false
    end
  end
end
