ActiveAdmin.register User, :as => 'Designer' do

  menu :priority => 2

  scope :all
  scope :active_designers
  scope :inactive_designers

  fields = [:first_name, :last_name, :phone, :email, :sign_in_count, :last_sign_in_at,
    :created_at, :updated_at]

  scope_to :association_method => :scoped do
    User.designers
  end

  fields.each do |field|
    filter field
  end

  # index action

  index :download_links => false do
    column :designer do |designer|
      link_to "##{designer.id}", admin_designer_path(designer)
    end
    fields.each do |field|
      column field
    end
    column :projects_count do |designer|
      designer.projects.size
    end
    column :state do |designer|
      status_tag designer.is_active ? 'active' : 'inactive', (designer.is_active ? :ok : '')
    end
    column :actions do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link view_link"
      links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links += link_to "Make #{!resource.is_active ? 'active' : 'inactive'}", change_state_admin_designer_path(resource), :method => :put, :class => "member_link"
      links
    end
  end

  #  Show action  #

  show :title => :full_name do
    panel "Projects History" do
      table_for(designer.projects) do
        column("Project", :sortable => :id) { |project| link_to "##{project.id}", admin_project_path(project)}
        column("Status") { |project| project.status }
        column("Package") { |project| project.design_request.package.title }
        #TODO write includes for nested models
        column("Request") { |project| link_to "#{project.design_request.room.title}", admin_design_request_path(project.design_request)}
        column("Customer") do |project| 
          if project.design_request.customer.present?
            link_to "#{project.design_request.customer.full_name}", admin_customer_path(project.design_request.customer)
          else
            "Unknown"
          end
        end
        column("Created", :sortable => :created_at) { |project| project.created_at }
      end
    end
  end

  sidebar "Designer Details", :only => :show do
    attributes_table_for designer, :id, :full_name, :email, :created_at do
      row "State" do
        status_tag designer.is_active ? 'active' : 'inactive', (designer.is_active ? :ok : '')
      end
    end
  end

  action_item :only => :show do
    link_to "Make #{!designer.is_active ? 'active' : 'inactive'}", change_state_admin_designer_path(designer), :method => :put
  end

  # custom action

  member_action :change_state, :method => :put do
    user = User.find(params[:id])
    user.change_state
    redirect_to :action => :index, :notice => "State Updated"
  end

  controller do
    include DesignersHelper
    before_filter :clean_password_params, :only => :update
    
    def new
      @designer = User.new
      initialize_portfolio(@designer)
    end

    def create
      @designer = User.new(params[:user])
      if @designer.save
        redirect_to admin_designer_path(@designer)
      else
        initialize_portfolio(@designer)
        render :new
      end
    end

    def edit
      @designer = User.find(params[:id])
      initialize_portfolio(@designer)
    end

    def update
      @designer = User.find(params[:id])
      if @designer.update_attributes(params[:user])
        redirect_to admin_designer_path(@designer)
      else
        render :edit
      end
    end

  end

  form partial: "form"

end

