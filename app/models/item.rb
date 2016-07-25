# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  sku          :string
#  product_name :string
#  price        :decimal(, )
#  order_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Item < ActiveRecord::Base
  belongs_to :order
end
