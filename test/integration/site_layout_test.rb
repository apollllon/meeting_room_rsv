require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    # assert_select "a[href=?]", room_index_path
    # assert_select "a[href=?]", users_calender_path
    # assert_select "a[href=?]", users_edit_path
  end
  
end
