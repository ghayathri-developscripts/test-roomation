ActiveAdmin.register User, :as => 'ManageUser' do

  menu :priority => 2
  actions  :index,:show, :edit, :destroy

  fields = [:first_name, :last_name, :phone, :email]

  scope_to :association_method => :scoped do
    User.customers
  end

  fields.each do |field|
    filter field
  end

  index :download_links => false do
    column :customer do |customer|
      link_to "##{customer.id}", admin_customer_path(customer)
      #link_to "##{customer.id}",I18n.t('active_admin.view'), admin_customer_path(customer), :class => "member_link view_link"
    end
    fields.each do |field|
      column field
    end
    column :actions do |customer|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.view'), admin_customer_path(customer), :class => "member_link view_link"
      links += link_to I18n.t('active_admin.edit'), edit_admin_customer_path(customer), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), admin_customer_path(customer), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end
    # column :view do |customer|
    #   link_to I18n.t('active_admin.view'), admin_customer_path(customer), :class => "member_link view_link"
      
    #   #link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
    # end
    # column :edit do |customer|
    #   link_to I18n.t('active_admin.edit'), edit_admin_customer_path(customer), :class => "member_link edit_link"
    # end
    # column :delete do |customer|
    #   link_to I18n.t('active_admin.delete'), admin_customer_path(customer), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
    # end
  end

  show :title => :full_name do
    panel "Design Requests History" do
      table_for(customer.design_requests) do
        column("Request", :sortable => :id) { |request| link_to "##{request.id}", admin_design_request_path(request)}
        column("On Step") { |request| request.step }
        column("Created", :sortable => :created_at) { |request| request.created_at }
        column("Package") do |request|
          if request.package.present?
            request.package.title
          end
        end
      end
    end
  end

  sidebar "Customer Details", :only => :show do
    attributes_table_for customer, :full_name, :email, :created_at
  end

# sidebar "Order History", :only => :show do
# attributes_table_for customer do
# row("Total Orders") { customer.orders.complete.count }
# row("Total Value") { number_to_currency customer.orders.complete.sum(:total_price) }
# end
# end
#
# sidebar "Active Admin Demo" do
# render('/admin/sidebar_links', :model => 'users')
# end

end
