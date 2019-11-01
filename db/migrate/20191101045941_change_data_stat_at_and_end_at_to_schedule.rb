class ChangeDataStatAtAndEndAtToSchedule < ActiveRecord::Migration[5.1]
  def change
    change_column :schedules, :start_at, :datetime
    change_column :schedules, :end_at, :datetime
  end
end
