require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  
  def setup
    @room = Room.new(name: "Example Room", price: 1000, capacity: 50, open_at: Time.now, close_at: Time.now)
  end

  test "should be valid" do
    assert @room.valid?
  end
  
  test "name should be present" do
    @room.name = ""
    assert_not @room.valid?
  end
  
  test "price should be present" do
    @room.price = nil
    assert_not @room.valid?
  end
  
  test "capacity should be present" do
    @room.capacity = nil
    assert_not @room.valid?
  end
  
  test "open_at should be present" do
    @room.open_at = nil
    assert_not @room.valid?
  end
  
  test "close_at should be present" do
    @room.close_at = nil
    assert_not @room.valid?
  end

  test "name should not be too long" do
    @room.name = "a" * 51
    assert_not @room.valid?
  end
  
  test "capacity should not be zero" do
    @room.capacity = 0
    assert_not @room.valid?
  end
  
  test "name should be unique" do
    duplicate_room = @room.dup
    duplicate_room.name = @room.name
    @room.save
    assert_not duplicate_room.valid?
  end
  
  
end
