class RemoveFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :sku
    remove_column :orders, :product_name
    add_column :orders, :order_key
  end
end
