class AddWindowsToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :windows, :text
  end
end
