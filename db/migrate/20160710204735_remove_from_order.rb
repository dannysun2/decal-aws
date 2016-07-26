class RemoveFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :sku
    remove_column :orders, :product_name
  end
end
