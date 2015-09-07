class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :photo, :null => false
      t.integer :group, :null => false

      t.timestamps
    end
  end
end
