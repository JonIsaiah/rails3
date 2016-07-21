require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "layout links" do
    get root_path
   # assert_template layout: "application"
    assert_template "static_pages/home"
    assert_template partial: "_default_head"
    assert_template partial: "_shim"
    assert_template partial: "_header"
    assert_template partial: "_footer"
    assert_select "title", full_title()
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", help_path
    
    get contact_path
    assert_template "static_pages/contact"
    assert_template partial: "_default_head"
    assert_template partial: "_shim"
    assert_template partial: "_header"
    assert_template partial: "_footer"
    assert_select "title", full_title("Contact")
  end
  
end
