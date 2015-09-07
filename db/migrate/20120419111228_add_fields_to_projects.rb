class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :phase_of_life, :string
    add_column :projects, :approach, :string
  end
end
