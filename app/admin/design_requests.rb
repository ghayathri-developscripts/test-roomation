ActiveAdmin.register DesignRequest do

  actions  :index, :show, :destroy
  before_filter :scoped_collection, only: [:index]
  filter :customer, :collection => proc { User.customers }
  filter :package
  filter :step
  filter :created_at

  fields = [:step, :created_at, :updated_at]

controller do
  def scoped_collection
    # some stuffs
    DesignRequest.where("user_id IS NOT NULL").order('updated_at desc')
  end 

  # other stuffs
end
  # controller do
  #   def design_name
  #     @design_request = DesignRequest.where("user_id IS NOT NULL")
  #   end
  # end
 
  index :download_links => false do
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
    column :package do  |recource|
      recource.package_name
    end

    column :transaction_Id do |recource|
      if recource.transaction
        recource.transaction.transaction_id
      else
        '-'
      end
    end

    fields.each do |field|
      column field
    end
    default_actions

  end

  show do
    design_request.style_poll.init_results_associations if design_request.style_poll.present?
    render 'admin/design_requests/info', :design_request => design_request
  end

end
