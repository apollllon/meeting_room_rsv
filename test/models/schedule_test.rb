require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @room = rooms(:example_room)
    @schedule = @room.schedules.build(name: "Example", content: "Lorem ipsum", 
                              start_at: Time.parse("20010101100000"), end_at: Time.parse("20010101120000"),
                              user_id: @user.id)
  end

  test "should be valid" do
    assert @schedule.valid?
  end

  test "name id should be present" do
    @schedule.name = nil
    assert_not @schedule.valid?
  end
  
  test "open_at id should be present" do
    @schedule.start_at = nil
    assert_not @schedule.valid?
  end
  
  test "end_at id should be present" do
    @schedule.end_at = nil
    assert_not @schedule.valid?
  end
  
  test "user id should be present" do
    @schedule.user_id = nil
    assert_not @schedule.valid?
  end
  
    test "room id should be present" do
    @schedule.room_id = nil
    assert_not @schedule.valid?
  end
end
