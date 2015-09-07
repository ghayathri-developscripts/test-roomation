class AddUsedForColumnToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :used_for, :text

  end
end
