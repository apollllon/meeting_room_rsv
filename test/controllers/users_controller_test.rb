require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get calender" do
    get users_calender_path
    assert_response :success
  end
  
  test "should get edit" do
    get users_edit_path
    assert_response :success
  end
  
  # login_page
  test "should get root" do
    get root_path
    assert_response :success
  end

end
