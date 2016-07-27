# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  purchase_date :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  buyer_id      :integer
#  recipient_id  :integer
#  order_key     :string
#

class Order < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  belongs_to :buyer
  belongs_to :recipient
  has_many :items

  def self.import(file)
    require 'csv'
    orders = CSV.read(file.path, headers:true, col_sep:",", :encoding => 'ISO-8859-1' )
    orders.each do |row|
        #looks up order to see if it exists
        order = Order.find_or_initialize_by order_key: row['order-id']

        # looks at buyer email to see if it exists
        buyer = Buyer.find_or_initialize_by email: row['buyer-email']

        unless buyer.email.nil?
          recipient = Recipient.find_or_initialize_by name: row['recipient-name'].downcase, address_line_1: row['ship-address-1'].downcase

          if buyer.new_record?
            buyer.name = row['buyer-name'].downcase
            buyer.phone = row['buyer-phone-number']
            buyer.save!
          end

          if recipient.new_record?
            recipient.address_line_2    = row['ship-address-2'].downcase if row['ship-address-2']
            recipient.address_city      = row['ship-city'].downcase
            recipient.address_state     = row['ship-state'].downcase
            recipient.address_zip       = row['ship-postal-code']
            recipient.phone             = row['ship-phone-number']
            recipient.save!
          end

          if order.new_record?
            order.purchase_date = row['purchase-date']
            order.order_key     = row['order-id']
            order.buyer_id      = buyer.id
            order.recipient_id  = recipient.id
            order.save!
          end

          item = Item.find_or_initialize_by product_name: row['product-name'], order_id: order.id

          if item.new_record?
            item.order_id       = order.id
            item.sku  = row['sku']
            item.product_name = row['product-name']
            item.price = row['item-price']
            item.save!
          end
        end
    end
  end

  def price
    number_to_currency(self.items.map{|x| x.price }.inject(:+), :precision => 2)
  end
end
