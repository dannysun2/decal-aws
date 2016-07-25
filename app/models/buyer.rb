# == Schema Information
#
# Table name: buyers
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Buyer < ActiveRecord::Base
  has_many :orders
  
  has_many :watchlist
  has_many :users, through: :watchlist


  def full_name
    name.split(' ').map!(&:capitalize).join(' ')
  end
end
