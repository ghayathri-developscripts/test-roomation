class Gallery < ActiveRecord::Base

    attr_accessible :title, :user_id, :comment, :about_project, :style, :front_end_type ,:budget, :location, :before_image, :after_image, :category_id, :sub_category_id, :project_type,:project_albums_attributes, :featured_products_attributes

    mount_uploader :before_image, PhotoAlbumUploader
    mount_uploader :after_image, PhotoAlbumUploader

	belongs_to :designer, :class_name => "User", :foreign_key => "user_id"
	belongs_to :category
	belongs_to :sub_category
	has_many :project_albums, :dependent => :destroy
	has_many :featured_products, :dependent => :destroy

	delegate :name, :to => :category, :prefix => true, :allow_nil => true
	delegate :name, :to => :sub_category, :prefix => true, :allow_nil => true

	accepts_nested_attributes_for :project_albums, reject_if: lambda { |a| a[:image].blank? },:allow_destroy => true
	accepts_nested_attributes_for :featured_products, reject_if: :all_blank ,:allow_destroy => true


	def get_first_album
		project_albums.first
	end

	def plan_type
		if project_type == 1
			"Style Boards"
		else
			"3D Room Visions"
		end
	end
end
