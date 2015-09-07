class AddBudetExplanationToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :budget_explanation, :string
  end
end
