ActiveAdmin.register Gallery do

	menu :parent => "Manage"
	# config.sort_order = 'position_asc'

	controller do
		def scoped_collection
	    	Gallery.order('position asc')
	  	end 

		def new
			@gallery = Gallery.new
			@gallery.project_albums.build
			@gallery.featured_products.build
		end

		def create
			@gallery = Gallery.new(params[:gallery])
			if @gallery.save
				redirect_to admin_galleries_path
			else
				@gallery.project_albums.build
				@gallery.featured_products.build
				render 'new'
			end
		end

		def edit
			@gallery = Gallery.find(params[:id])
			@gallery.project_albums.build
			@gallery.featured_products.build
		end

		def update
		    @gallery = Gallery.find(params[:id])
		    if @gallery.update_attributes(params[:gallery])
		        redirect_to admin_gallery_path(@gallery)
		    else
		        render :edit
		    end
		end
	end

	form partial: "form"


	show do |gallery|
	 	attributes_table do
	 		row :title
	 		row :designer
	 		row :comment
	 		row "About this gallery" do
	 			raw gallery.about_project
	 		end
	 		row :project_type do |type|
	 			if type.project_type == 1
	 				"Style Boards"
	 			elsif type.project_type == 2
	 				"3D Room Visions"
	 			end
	 		end
	 		row "Before Image" do |image|
    			image_tag(image.before_image.thumb)
  			end
  			row "After Image" do |image|
  				image_tag(image.after_image.thumb)
  			end
			row "Project Style Board Images" do |gallery|
				ul do
					gallery.project_albums.each do |img|
				  		li do 
				    		image_tag(img.image.thumb)
				  		end
					end
				end
			end
			row "Featured Products" do |products|
				ul do
					products.featured_products.each do |img|
				  		li do 
				    		image_tag(img.image.thumb)
				  		end
				  		img.description
					end
				end
			end
		end
	end

	index do
		column :id
		column :title
		column :category_name
		column :sub_category_name
		column :project_type do |type|
			if type.project_type == 1
				"Style Boards"
			else
				"3D Room Visions"
			end
		end
		column :created_at
		column :updated_at
		default_actions
	end

	collection_action :sort, :method => :post do
	    params[:gallery].each_with_index do |id, index|
	      Gallery.update_all(['position=?', index+1], ['id=?', id])
	    end
	    render :nothing => true
	end
  
end
