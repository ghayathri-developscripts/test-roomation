ActiveAdmin.register User, :as => 'Customer' do

  menu :priority => 2
  actions  :index, :show,:edit,:destroy,:update

  fields = [:first_name, :last_name, :phone, :email, :sign_in_count, :last_sign_in_at, 
    :created_at, :updated_at, :facebook_id, :twitter_id]

  scope_to :association_method => :scoped do
    User.customers
  end


form do |f|
  f.inputs do
    f.input :first_name
    f.input :last_name
    f.input :phone
    f.input :email
  end
  f.buttons
end
  #fields.each do |field|
    #filter field
 # end

  index :download_links => false do
    column :customer do |customer|
      link_to "##{customer.id}", admin_customer_path(customer)
    end

    column :StyleQuiz do |customer|
      #unless customer.design_requests.blank?
      a=User.find(customer.id)
      unless a.style_poll.blank?
        unless a.style_poll.style_quiz_result.nil? && a.style_poll.color_quiz_result.nil?
        s= a.style_poll.style_quiz_result
        r= a.style_poll.color_quiz_result
        "#{s.name} , #{r.name}"
      
      else
        'none'
      end
      else
        'none'
      end
    end
    fields.each do |field|
      column field
    end
    default_actions
    # column :actions do |resource|
    #   links = ''.html_safe
    #   links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link view_link"
    #   links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
    #   links
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

