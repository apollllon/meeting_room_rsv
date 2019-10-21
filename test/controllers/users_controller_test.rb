require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get calender" do
    get users_calender_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end
  
  # login_page
  test "should get root" do
    get root_url
    assert_response :success
  end

end
