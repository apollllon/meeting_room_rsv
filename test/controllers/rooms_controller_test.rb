require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
  
  test "should redirect index when not logged in" do
    get rooms_path
    assert_redirected_to login_url
  end
end
