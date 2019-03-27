require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = users :default
  end
  
  test "should validate" do
    assert @user.valid?, "user instance is not valid"
  end
  
  test "should check email instance variable against optional list of allowed domains" do
    assert @user.email_domain_is_in_allowed_list?([]), "returns false when allowed domains list is empty"
    
    right_domain = "bar.com"
    wrong_domain = "baz.qux"
    @user.email = "username@" + right_domain
    
    assert @user.email_domain_is_in_allowed_list?([right_domain]), "returns false when user email is present in allowed domains list"
    assert_not @user.email_domain_is_in_allowed_list?([wrong_domain]), "returns true when user email is not present in allowed domains list"
  end
  
  test "should find with email and password" do
    @user.password = "testpassword"
    @user.save
    
    assert_equal @user.id, User.find_by_credentials(@user.email, @user.password).id, "does not return user associated with credentials"
  end
end