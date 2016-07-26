class AddOrderkeyToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_key, :string
  end
end
