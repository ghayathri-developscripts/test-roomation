class DropWindows < ActiveRecord::Migration
  def up
    drop_table :windows
  end

  def down
    create_table :windows do |t|
      t.integer :width
      t.integer :height
      t.integer :depth
      t.integer :room_id

      t.timestamps
    end
  end
end
