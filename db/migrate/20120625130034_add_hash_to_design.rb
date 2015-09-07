class AddHashToDesign < ActiveRecord::Migration
  def change
    add_column :design_requests, :design_hash, :string
  end
end
