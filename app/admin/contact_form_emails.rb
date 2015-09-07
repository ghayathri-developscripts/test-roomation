ActiveAdmin.register ContactFormEmail do

  actions  :index, :show, :destroy
  
  fields = [:created_at, :email, :first_name, :last_name, :message]

  fields.each do |field|
    filter field
  end

  index :download_links => false do
    fields.each do |field|
      column field
    end
    default_actions
  end
  
end
