class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :name
      t.integer :amount, null: false, default: 0 
      t.integer :discount_type, null: false, default: 1
      t.datetime :expiration_date
      t.datetime :start_date
      t.string :code
      t.integer :package_id

      t.timestamps
    end
  end
end
