class AddFieldsToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :colors, :string
    add_column :rooms, :rejected_colors, :string
    add_column :rooms, :type_of_wood, :string
    add_column :rooms, :kind_of_fabrics, :string
    add_column :rooms, :art_id, :integer
    add_column :rooms, :material_id, :integer
    add_column :rooms, :notes, :string
    add_column :projects, :custom_shops, :string
  end
end
