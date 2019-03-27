require 'test_helper'

class OrderGroupTest < ActiveSupport::TestCase
  
  def setup
    @order_group = order_groups :default
  end
  
  test "should validate" do
    assert @order_group.valid?, "default order group instance is not valid"
  end
  
end