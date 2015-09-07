class AddCurrentStepToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :current_step, :string
  end
end
