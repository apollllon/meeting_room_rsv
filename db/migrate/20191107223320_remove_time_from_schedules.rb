class RemoveTimeFromSchedules < ActiveRecord::Migration[5.1]
  def change
    remove_column :schedules, :start_at, :datetime
    remove_column :schedules, :end_at, :datetime
  end
end
