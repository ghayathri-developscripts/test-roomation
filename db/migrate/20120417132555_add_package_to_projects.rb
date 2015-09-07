class AddPackageToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :package_id, :integer
  end
end
