class AddRoomIdToAlbum < ActiveRecord::Migration
  def change
    add_column :photo_albums, :room_id, :integer
  end
end
