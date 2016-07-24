require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "User should not be created with invalid inputs" do
    get signup_path
    assert_no_difference 'User.count' do 
      post signup_path, params: { user: { name:  "",
                                        email: "user@invalid",
                                        password:              "foo",
                                        password_confimation:  "bar"} }
    end
    assert_template 'users/new'
    assert_select 'div.field_with_errors'
    assert_select 'div#error_explanation'
    assert_select 'form[action="/signup"]'
  end
  
  test "User should be added to database if given valid inputs" do
    get signup_path
    assert_difference 'User.count', 1 do 
      post signup_path, params: { user: { name:  "example user",
                                        email: "user@example.com",
                                        password:              "foobar22",
                                        password_confimation:  "foobar22"} }
    end
    follow_redirect!
    assert_template 'users/show'
    assert flash[:success]  ##should be changed to assert_not flash.empty?
  end
  
end
