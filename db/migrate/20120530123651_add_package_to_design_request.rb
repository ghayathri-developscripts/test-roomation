class AddPackageToDesignRequest < ActiveRecord::Migration
  def change
    add_column :design_requests, :package_id, :integer
  end
end
