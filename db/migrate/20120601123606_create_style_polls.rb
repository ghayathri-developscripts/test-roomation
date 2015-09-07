class CreateStylePolls < ActiveRecord::Migration
  def change
    create_table :style_polls do |t|
      t.references :user

      t.timestamps
    end
  end
end
