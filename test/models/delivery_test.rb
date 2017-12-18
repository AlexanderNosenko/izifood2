# == Schema Information
#
# Table name: deliveries
#
#  id                  :integer          not null, primary key
#  deliver_on          :date             not null
#  cost_value          :decimal(5, 2)    not null
#  cost_currency       :string           not null
#  time_from           :string           not null
#  time_to             :string           not null
#  order_id            :integer          not null
#  delivery_address_id :integer          not null
#  deliver_on_from     :datetime         not null
#  deliver_on_to       :datetime         not null
#

require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
