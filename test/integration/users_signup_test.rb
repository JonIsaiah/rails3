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
end
