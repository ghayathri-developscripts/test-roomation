class SwapFieldsForProjectAndDesignRequests < ActiveRecord::Migration
  def up
    add_column :design_requests, :budget_explanation,   :string
    add_column :design_requests, :other_wishes,         :text
    add_column :design_requests, :budget_type_id,       :integer
    add_column :design_requests, :life_phase_id,        :integer
    add_column :design_requests, :project_approach_id,  :integer
    
    add_column :rooms, :custom_shops, :string
    
    remove_column :projects, :budget_explanation
    remove_column :projects, :budget
    remove_column :projects, :phase_of_life
    remove_column :projects, :approach
    remove_column :projects, :custom_shops
  end
  
  def down
    remove_column :design_requests, :budget_explanation
    remove_column :design_requests, :other_wishes
    remove_column :design_requests, :budget_type_id
    remove_column :design_requests, :life_phase_id
    remove_column :design_requests, :project_approach_id
    
    remove_column :rooms, :custom_shops
    
    add_column :projects, :budget_explanation, :string
    add_column :projects, :budget, :string
    add_column :projects, :phase_of_life, :string
    add_column :projects, :approach, :string
    add_column :projects, :custom_shops, :string
  end
end
