class RoomStyleItem < Item

  has_many :room_items, :foreign_key  => :item_id
  has_many :rooms, :through  => :room_items

end
# == Schema Information
#
# Table name: items
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  type        :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  description :string(255)
#  photo       :string(255)
#

