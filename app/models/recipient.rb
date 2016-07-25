# == Schema Information
#
# Table name: recipients
#
#  id             :integer          not null, primary key
#  name           :string
#  address_line_1 :string
#  address_line_2 :string
#  address_city   :string
#  address_state  :string
#  address_zip    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  phone          :string
#

class Recipient < ActiveRecord::Base
  has_many :orders
  
  def full_name
    name.split(' ').map!(&:capitalize).join(' ')
  end
end
