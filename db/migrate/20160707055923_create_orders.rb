class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :purchase_date
      t.string :sku
      t.string :product_name

      t.timestamps null: false
    end
  end
end
