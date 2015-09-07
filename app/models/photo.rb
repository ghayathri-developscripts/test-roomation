class Photo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader
  
  belongs_to :user
  belongs_to :album, :class_name => "PhotoAlbum"
  
  attr_accessible :description, :image, :image_cache

  attr_writer :album_name
  
  def album_name
    @album_name ||= album.try(:name)
  end
end

# == Schema Information
#
# Table name: photos
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  album_id    :integer
#  image       :string(255)
#  name        :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

