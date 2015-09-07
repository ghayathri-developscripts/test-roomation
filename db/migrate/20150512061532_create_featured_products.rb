class CreateFeaturedProducts < ActiveRecord::Migration
  def change
    create_table :featured_products do |t|
      t.integer :gallery_id
      t.string	:image
      t.text 	:description
      t.timestamps
    end
  end
end
