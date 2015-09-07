require 'spec_helper'

describe Transaction do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: transactions
#
#  id                   :integer         not null, primary key
#  transaction_id       :string(255)
#  amount               :string(255)
#  customer_first_name  :string(255)
#  customer_last_name   :string(255)
#  customer_email       :string(255)
#  credit_masked_number :string(255)
#  credit_card_type     :string(255)
#  design_request_id    :integer
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#

