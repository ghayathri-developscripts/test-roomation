ActiveAdmin.register SubCategory do

	# actions :all, :except => [:destroy]

	menu :parent => "Manage", priority: 3

	fields = [:name]

	fields.each do |field|
		filter field
	end

	filter :category , label: 'Category', :collection => proc {(Category.all).map{|c| [c.name, c.id]}}

	# permit_params :name

	form do |f|
	  f.inputs do
      f.input :category_id, :label => 'Category', :as => :select, :collection => Category.all, :prompt => "-Select Category-"
	    f.input :name
	  end
	  f.buttons
	end


   	index :title => "Sub-Category"  do
   		column :name
      	column :category
    	default_actions
   	end

   	show do
   		attributes_table do
      		row :name
      		row	:category
      		row :created_at
      		row :updated_at
    	end
   	end
  
end
