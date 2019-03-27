require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  
  def setup
    @restaurant = restaurants :default
  end

  test "instance should validate" do
    assert @restaurant.valid?, "default restaurant instance is not valid"
  end
  
end