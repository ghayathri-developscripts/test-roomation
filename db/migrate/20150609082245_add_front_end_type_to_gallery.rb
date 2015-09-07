class AddFrontEndTypeToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :front_end_type, :integer, default: 2
  end
end
