class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
