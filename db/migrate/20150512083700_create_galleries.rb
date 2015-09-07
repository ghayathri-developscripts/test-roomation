class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
    	t.string :title
		t.integer :user_id
		t.text :comment
		t.text :about_project
		t.string :style
		t.float :budget
		t.string :location
		t.string :before_image
		t.string :after_image
		t.integer :category_id
		t.integer :sub_category_id
		t.integer :project_type
      t.timestamps
    end
  end
end
