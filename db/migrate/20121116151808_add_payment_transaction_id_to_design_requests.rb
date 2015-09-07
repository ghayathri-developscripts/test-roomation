class AddPaymentTransactionIdToDesignRequests < ActiveRecord::Migration
  def change
    add_column :design_requests, :payment_transaction_id, :string

  end
end
