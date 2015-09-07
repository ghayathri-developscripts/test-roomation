class ProjectAlbum < ActiveRecord::Base

	belongs_to :gallery, :class_name => "Gallery", :foreign_key => "gallery_id"
	 mount_uploader :image, GalleryUploader
end
