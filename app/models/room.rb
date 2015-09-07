class Room < ActiveRecord::Base

  belongs_to :design_request
  
  belongs_to :color_set
  belongs_to :fabric
  belongs_to :wood_type

  has_many :room_photo_albums
  has_many :photo_albums, through: :room_photo_albums
  accepts_nested_attributes_for :photo_albums

  has_many :room_items
  has_many :arts,       :through  => :room_items, :source  => :room_style_item, :class_name  => 'Art'
  has_many :furnitures, :through  => :room_items, :source  => :room_style_item, :class_name  => 'Furniture'
  has_many :shops,      :through  => :room_items, :source  => :room_style_item, :class_name  => 'Shop'
  
  validates_presence_of :arts, :furnitures, :shops, :color_set, :fabric, :wood_type, :if  => :validation_needed?
  #validates_length_of :title, :maximum => 250
  def validation_needed?
    design_request.validation_enabled? && design_request.my_room_continued?
  end

  def my_room_album
    self.photo_albums.where(:name => "my room")
  end

  def items_album
    self.photo_albums.where(:name => "items")
  end

  def other_rooms_album
    self.photo_albums.where(:name => "other rooms")
  end
end

# == Schema Information
#
# Table name: rooms
#
#  id                :integer         not null, primary key
#  design_request_id :integer
#  title             :string(255)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  windows           :text
#  rejected_colors   :string(255)
#  custom_shops      :string(255)
#  color_set_id      :integer
#  fabric_id         :integer
#  wood_type_id      :integer
#  room_size         :string(255)
#  used_for          :text
#

