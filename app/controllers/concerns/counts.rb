module Counts
  extend ActiveSupport::Concern
  def order_counts
    @order_count = Order.all.count
    @customer_count = Buyer.all.count
  end
end
