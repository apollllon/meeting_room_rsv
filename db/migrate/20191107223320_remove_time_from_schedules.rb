class RemoveTimeFromSchedules < ActiveRecord::Migration[5.1]
  def change
    remove_column :schedules, :start_at, :time
    remove_column :schedules, :end_at, :time
  end
end
