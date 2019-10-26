class AddPriceColumunToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :price, :integer
  end
end
