class CreateProjectAlbums < ActiveRecord::Migration
  def change
    create_table :project_albums do |t|
      t.integer :gallery_id
      t.string	:image
      t.integer :main_photo_id
      t.timestamps
    end
  end
end
