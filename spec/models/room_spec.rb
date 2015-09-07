require 'spec_helper'

describe Room do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: rooms
#
#  id                :integer         not null, primary key
#  design_request_id :integer
#  width             :integer
#  height            :integer
#  depth             :integer
#  title             :string(255)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  windows           :text
#  rejected_colors   :string(255)
#  custom_shops      :string(255)
#  color_set_id      :integer
#  fabric_id         :integer
#  wood_type_id      :integer
#

