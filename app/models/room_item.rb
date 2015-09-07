class RoomItem < ActiveRecord::Base
  belongs_to :room
  belongs_to :room_style_item, :foreign_key  => :item_id
end
# == Schema Information
#
# Table name: room_items
#
#  id         :integer         not null, primary key
#  room_id    :integer
#  item_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

