class AddEnteredDiscountCodeToDesignRequests < ActiveRecord::Migration
  def change
    add_column :design_requests, :entered_discount_code, :string

  end
end
