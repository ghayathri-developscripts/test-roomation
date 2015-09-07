class CreateRoomItems < ActiveRecord::Migration
  def change
    create_table :room_items do |t|
      t.integer :room_id
      t.integer :item_id

      t.timestamps
    end
  end
end
