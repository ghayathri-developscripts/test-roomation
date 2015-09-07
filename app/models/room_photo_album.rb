class RoomPhotoAlbum < ActiveRecord::Base
  belongs_to :room
  belongs_to :photo_album
end

# == Schema Information
#
# Table name: room_photo_albums
#
#  id             :integer         not null, primary key
#  room_id        :integer
#  photo_album_id :integer
#

