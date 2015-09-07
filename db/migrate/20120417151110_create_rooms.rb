class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :project_id
      t.integer :width
      t.integer :height
      t.integer :depth
      t.string :title

      t.timestamps
    end
  end
end
