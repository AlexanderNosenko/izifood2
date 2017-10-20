# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  menu_id    :integer
#  deliver_on :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :menu     
  has_many :order_items, :dependent => :delete_all
  
  accepts_nested_attributes_for :order_items

  def items
  	order_items	
  end
end