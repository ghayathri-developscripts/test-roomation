ActiveAdmin.register Article do
 actions  :index, :show,:edit,:update
  form do |f|
  f.inputs do
  	#f.input :title
    #f.cktext_area :body
    f.input :body
    #f.input :body, :as => :ckeditor
  end
  f.buttons
end 
end
