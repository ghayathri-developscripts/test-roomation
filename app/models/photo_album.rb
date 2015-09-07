class PhotoAlbum < ActiveRecord::Base
  has_many :photos, :foreign_key => :album_id, :dependent => :destroy
  has_one :user
  has_one :room_photo_album
  belongs_to :main_photo, class_name: 'Photo'

  attr_accessible :photos_attributes, :name, :main_photo_id

  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

  before_save :check_main_photo

  def my_room_album_photo
    errors.add(:photos, "must have at least one image") if photos.length < 1
  end

  def to_s
    name
  end

  def check_main_photo
    if main_photo.nil?
      main_photo_id = nil
    end
  end
end

# == Schema Information
#
# Table name: photo_albums
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  description   :text
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  main_photo_id :integer
#

