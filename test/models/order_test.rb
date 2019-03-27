require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  
  def setup
    @order = orders :default
  end
  
  test "should validate" do
    assert @order.valid?, "default order instance is not valid"
  end
  
end