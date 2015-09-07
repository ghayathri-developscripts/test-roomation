class CreateDesignRequests < ActiveRecord::Migration
  def change
    create_table :design_requests do |t|
      t.integer :user_id
      t.integer :designer_id
      t.integer :project_id
      t.string  :step
      
      t.timestamps
    end
  end
end
