ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  section "Recent Reveals", :priority => 1 do
    table_for Reveal.order(:created_at).limit(10).each do 
      column("Name")    {|reveal| reveal.name       }
      column("Email")   {|reveal| reveal.email      }
      column("Date")    {|reveal| reveal.created_at }
    end
  end
  
  section "Recent Customers", :priority => 2 do
    table_for User.customers.order('users.id desc').limit(10).each do
      column(:email)   {|customer| link_to(customer.email, admin_customer_path(customer)) }
      column(:name)    {|customer| customer.full_name }
    end
  end

  section "Recent Design Request", :priority => 3 do
    table_for DesignRequest.order('design_requests.id desc').limit(10).each do
      column :design_request do |recource|
        link_to recource.design_request_name, admin_design_request_path(recource)
      end
      column :customer do |recource|
        customer = recource.customer
        if customer.present?
          if customer.is_role? :user
            link_to "##{customer.id} #{customer.full_name}", admin_customer_path(customer)
          else
            "Admin"
          end
        else
          '-'
        end
      end
      column :package do |recource|
        recource.package_name
      end
    end
  end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
