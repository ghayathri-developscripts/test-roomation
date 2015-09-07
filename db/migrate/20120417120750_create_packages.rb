class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :title
      t.integer :price_cents, :default => 0, :null => false
      t.string :code
      t.string :benefits

      t.timestamps
    end
  end
end
