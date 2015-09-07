class AddFromColumnToReveals < ActiveRecord::Migration
  def change
    add_column :reveals, :from, :string
  end
end
