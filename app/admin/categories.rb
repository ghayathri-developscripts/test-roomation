ActiveAdmin.register Category do

	# actions :all, :except => [:destroy]

	menu :parent => "Manage"

	fields = [:name]

	fields.each do |field|
		filter field
	end

	# permit_params :name

	form do |f|
	  f.inputs do
	    f.input :name
	  end
	  f.buttons
	end


   	index :title => "Category"  do
   		fields.each do |field|
      		column field
    	end
    	default_actions
   	end

   	show do
   		attributes_table do
      		row :name
      		row :created_at
      		row :updated_at
    	end
   	end
  
end
