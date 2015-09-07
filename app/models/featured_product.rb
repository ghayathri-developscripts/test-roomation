class FeaturedProduct < ActiveRecord::Base
	mount_uploader :image, GalleryUploader
	belongs_to :gallery, class_name: "Gallery", :foreign_key => "gallery_id"
end
