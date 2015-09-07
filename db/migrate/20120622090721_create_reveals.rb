class CreateReveals < ActiveRecord::Migration
  def change
    create_table :reveals do |t|
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
