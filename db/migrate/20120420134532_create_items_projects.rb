class CreateItemsProjects < ActiveRecord::Migration
  def up
    create_table :items_projects, :id => false do |t|
      t.integer :item_id
      t.integer :project_id
    end
    add_index :items_projects, [:item_id, :project_id], :name => 'index_items_projects'
  end

  def down
    drop_table :items_projects
  end
end
