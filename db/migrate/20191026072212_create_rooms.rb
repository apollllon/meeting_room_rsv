class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.int :capacity
      t.time :open_at
      t.time :close_at

      t.timestamps
    end
  end
end
