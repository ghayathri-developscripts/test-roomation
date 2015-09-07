class AddFieldsToRoom < ActiveRecord::Migration
  def up
    add_column :rooms, :color_set_id, :integer
    add_column :rooms, :fabric_id,    :integer
    add_column :rooms, :wood_type_id, :integer
    
    remove_column :rooms, :colors
    remove_column :rooms, :type_of_wood
    remove_column :rooms, :kind_of_fabrics
    remove_column :rooms, :art_id
    remove_column :rooms, :material_id
    remove_column :rooms, :notes
  end
  
  def down
    remove_column :rooms, :color_set_id
    remove_column :rooms, :fabric_id
    remove_column :rooms, :wood_type_id
    
    add_column :rooms, :colors,           :string
    add_column :rooms, :type_of_wood,     :string
    add_column :rooms, :kind_of_fabrics,  :string
    add_column :rooms, :art_id,           :integer
    add_column :rooms, :material_id,      :integer
    add_column :rooms, :notes,            :string
  end
end
