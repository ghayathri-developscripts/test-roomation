class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_id
      t.string :amount
      t.string :customer_first_name
      t.string :customer_last_name
      t.string :customer_email
      t.string :credit_masked_number
      t.string :credit_card_type
      t.integer :design_request_id
      t.timestamps
    end
  end
end
