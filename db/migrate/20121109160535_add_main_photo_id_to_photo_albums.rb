class AddMainPhotoIdToPhotoAlbums < ActiveRecord::Migration
  def change
    add_column :photo_albums, :main_photo_id, :integer
  end
end
