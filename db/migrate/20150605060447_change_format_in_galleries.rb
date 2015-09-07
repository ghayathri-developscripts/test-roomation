class ChangeFormatInGalleries < ActiveRecord::Migration
  def up
  	change_column :galleries, :budget, :string
  end

  def down
  	change_column :galleries, :budget, :float
  end
end
