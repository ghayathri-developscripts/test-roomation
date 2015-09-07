class AddRoomPhotoAlbumsTable < ActiveRecord::Migration
  def up
    create_table :room_photo_albums do |t|
      t.integer :room_id
      t.integer :photo_album_id
    end

    add_column :users, :photo_album_id, :integer
    remove_column :photo_albums, :room_id
    remove_column :photo_albums, :user_id
  end

  def down
    add_column :photo_albums, :room_id, :integer
    add_column :photo_albums, :user_id, :integer
    remove_column :users, :photo_album_id

    drop_table :room_photo_albums
  end
end
