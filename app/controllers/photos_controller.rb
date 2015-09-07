class PhotosController < InheritedResources::Base
  before_filter :authenticate_user!
  
  actions :all, :except => :show
  
  def begin_of_association_chain
    current_user
  end
end
