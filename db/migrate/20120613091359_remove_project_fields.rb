class RemoveProjectFields < ActiveRecord::Migration
  def up
    remove_column :projects, :name
    remove_column :projects, :status
    remove_column :projects, :current_step
    remove_column :projects, :package_id
  end

  def down
    add_column :projects, :name,         :string
    add_column :projects, :status,       :string
    add_column :projects, :current_step, :string
    add_column :projects, :package_id,   :integer
  end
end
