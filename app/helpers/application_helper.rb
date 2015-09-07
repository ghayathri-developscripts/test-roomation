module ApplicationHelper
  def all_image_categories
    ImageCategory.find(:all)
  end        
   
  def designer_name(id)
    Designer.find(id).full_name if id
  end
  
  def user_requests_count
    link_to "#{UserRequest.active.count}", "/not_assigned_list"
  end
    
  def add_picture_link(name,f, association)              
    link_to name, "#bottom_link", :onclick=>"$('#insert_new_pictures').append('#{escape_javascript(render :partial => 'pictures',:locals=>{:f=>f, :object=>Image.new})}');"
  end


  def plan_type
    hash = {"Style Boards" => "1", "3D Room Visions"  => "2"}
    hash
  end

end

