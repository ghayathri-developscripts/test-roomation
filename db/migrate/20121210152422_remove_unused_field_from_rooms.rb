class RemoveUnusedFieldFromRooms < ActiveRecord::Migration
  def up
    remove_column :rooms, :width
    remove_column :rooms, :height
    remove_column :rooms, :depth
  end

  def down
    add_column :rooms, :width, :integer
    add_column :rooms, :height, :integer
    add_column :rooms, :depth, :integer
  end
end
