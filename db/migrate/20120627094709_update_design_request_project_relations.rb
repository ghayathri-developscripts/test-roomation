class UpdateDesignRequestProjectRelations < ActiveRecord::Migration
  def up
    remove_column :design_requests, :project_id
    remove_column :design_requests, :designer_id
    
    add_column  :projects, :design_request_id, :integer
  end

  def down
    add_column :design_requests, :project_id, :integer
    add_column :design_requests, :designer_id, :integer
    
    remove_column :projects, :design_request_id
  end
end
