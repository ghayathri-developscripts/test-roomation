class RemoveTransactionIdFromDesignRequests < ActiveRecord::Migration
  def up
    remove_column :design_requests, :payment_transaction_id
  end

  def down
    add_column :design_requests, :payment_transaction_id, :string
  end
end
