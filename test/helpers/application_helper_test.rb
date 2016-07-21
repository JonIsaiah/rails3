require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "Jons Damn Tutorial App"
    assert_equal full_title("Help"), "Help | Jons Damn Tutorial App"
  end
end