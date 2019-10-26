require 'test_helper'

class RoomsCreateTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test "invalid room information" do
    log_in_as(@user)
    get new_room_path
    assert_no_difference 'Room.count' do
      post rooms_path, params: {room: { name: "",
                                        price: 1000,
                                        capacity: 10,
                                        open_at: Time.parse("20010101090000"),
                                        close_at: Time.parse("20010101210000") }}
    end
    assert_template 'rooms/new'
  end
  
  test "valid room information" do
    log_in_as(@user)
    get new_room_path
    assert_difference 'Room.count', 1 do
      post rooms_path, params: {room: { name: "example room",
                                        price: 1000,
                                        capacity: 10,
                                        open_at: Time.parse("20010101090000"),
                                        close_at: Time.parse("20010101210000") }}
    end
    follow_redirect!
    assert_template 'rooms/show'
  end
end
