ActiveAdmin.register InviteRequest do

  actions  :index, :show, :destroy
  
  fields = [:email, :name, :created_at]

  fields.each do |field|
    filter field
  end

  index :download_links => false do
    column :id do |invite_request|
      link_to "##{invite_request.id}", admin_invite_request_path(invite_request)
    end
    fields.each do |field|
      column field
    end
    [:portfolio_web, :resume_web].each do |field|
      column field do |object|
        link = object.send(field)
        link_to(link, link) if link
      end
    end
    [:portfolio, :resume].each do |field|
      column field do |object|
        link = object.send(field)
        link_to(link.url.split('/').last, link.url) if link.present?
      end
    end    
    default_actions
  end
  
  show :title => :name do |inv_r|
    attributes_table do
      fields.each do |f|
        row f do
           inv_r.send(f) 
        end
      end 
      [:portfolio_web, :resume_web].each do |field|
        row field do
          link = inv_r.send(field)
          link_to(link, link) if link
        end
      end
      [:portfolio, :resume].each do |field|
        row field do
          link = inv_r.send(field)
          link_to(link.url.split('/').last, link.url) if link.present?
        end
      end      
    end
  end  
  
end
