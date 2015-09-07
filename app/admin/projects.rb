ActiveAdmin.register Project do
  
  actions :index, :show, :destroy
  
  filter :designer, :collection => proc { User.designers }
  filter :status
  filter :created_at
  filter :updated_at

  fields = [:created_at, :updated_at]

  index :download_links => false do
    column :project do |recource|
      link_to "##{recource.id}", admin_project_path(recource)
    end
    column :design_request do |recource|
      link_to "##{recource.design_request.id} #{recource.design_request.room.title}", admin_design_request_path(recource.design_request) if recource.design_request.present?
    end
    column :designer do |recource|
      link_to "##{recource.designer.id} #{recource.designer.full_name}", admin_designer_path(recource.designer) if recource.design_request.present?
    end
    column :customer do |recource|
      link_to "##{recource.design_request.customer.id} #{recource.design_request.customer.full_name}", admin_customer_path(recource.design_request.customer) if recource.design_request.present? && recource.design_request.customer.present?
    end
    fields.each do |field|
      column field
    end
    column :state do |recource|
      status = ''
      case recource.status_name
        when :confirmed
          status = :warning
        when :in_progress
          status = :ok
      end 
      status_tag recource.status, status
    end
    default_actions
    
  end

  
end
