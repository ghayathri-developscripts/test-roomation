class GalleriesController < ApplicationController


	# Main Gallery Page
	def gallery
		@categories = Category.all
		if params[:type_ids].present? && params[:plan_ids].present?
			type_list = params[:type_ids].split(",")
			plan_list = params[:plan_ids].split(",")
			@galleries = Gallery.where("sub_category_id IN (?) and project_type IN (?)",type_list, plan_list).order('position ASC').page(params[:page]).per(15)
		elsif params[:plan_ids].present?
			plan_list = params[:plan_ids].split(",")
			@galleries = Gallery.where("project_type IN (?)", plan_list).order('position ASC').page(params[:page]).per(15)
		elsif params[:type_ids].present?
			type_list = params[:type_ids].split(",")
			@galleries = Gallery.where("sub_category_id IN (?)", type_list).order('position ASC').page(params[:page]).per(15)
		else
			@galleries = Gallery.order('position ASC').page(params[:page]).per(15)
		end
	end

	# Show Page for each individual Gallery
	def show
		@gallery = Gallery.find(params[:id])
		@albums = @gallery.project_albums
		@products = @gallery.featured_products.in_groups_of(4,false)
		@designer = @gallery.designer
		@other_galleries = @designer.galleries.where('id <> ?' , @gallery.id).in_groups_of(4,false)
		@sub_galleries = @gallery.sub_category.galleries.where('id <> ?' , @gallery.id).in_groups_of(4,false)
	end

end
