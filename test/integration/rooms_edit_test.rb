require 'test_helper'

class RoomsEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @room = rooms(:example_room)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_room_path(@room)
    assert_template 'rooms/edit'
    patch room_path(@room), params: {room: { name: "",
                                        price: 1000,
                                        capacity: 10,
                                        open_at: Time.parse("20010101090000"),
                                        close_at: Time.parse("20010101210000") }}

    assert_template 'rooms/edit'
  end
  
  test "successful edit" do
    log_in_as(@user)
    get edit_room_path(@room)
    assert_template 'rooms/edit'
    name  = "Foo Bar"
    price = 2000
    capacity = 100
    open_at = Time.parse("20010101100000")
    close_at = Time.parse("20010101200000")
    patch room_path(@room), params: {room: { name: name,
                                        price: price,
                                        capacity: capacity,
                                        open_at: open_at,
                                        close_at: close_at }}
    assert_not flash.empty?
    assert_redirected_to @room
    @room.reload
    assert_equal name,  @room.name
    assert_equal price, @room.price
    assert_equal capacity,  @room.capacity
    assert_equal open_at.strftime('%H:%M'),  @room.open_at.strftime('%H:%M')
    assert_equal close_at.strftime('%H:%M'),  @room.close_at.strftime('%H:%M')
  end

end
