require 'spec_helper'

describe Discount do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: discounts
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  amount          :integer         default(0), not null
#  discount_type   :integer         default(1), not null
#  expiration_date :datetime
#  start_date      :datetime
#  code            :string(255)
#  package_id      :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

