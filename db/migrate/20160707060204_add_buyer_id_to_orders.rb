class AddBuyerIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :buyer_id, :integer
    add_column :orders, :recipient_id, :integer
  end
end
