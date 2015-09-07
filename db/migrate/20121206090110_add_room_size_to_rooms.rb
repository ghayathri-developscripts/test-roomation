class AddRoomSizeToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :room_size, :string
  end
end
