class AddFieldsToFeaturedProduct < ActiveRecord::Migration
  def change
  	add_column :featured_products, :name, :string
  	add_column :featured_products, :price, :string
  	add_column :featured_products, :store_name, :string
  end
end
