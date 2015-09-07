class UserRequestsController < InheritedResources::Base
  before_filter :authenticate_user
  actions :all
  
  def new 
    #TODO USER REQUESTS = only DESIGNER INvite requests - move to action in designers controller
    if params[:id] && current_user && ( params[:id].to_i == current_user.id )
      user_request = UserRequest.new(:user_id=>params[:id])
      if user_request.save
        flash[:notice] = "Thank you, your request will be processed till 24 hours"        
      else                
        flash[:error] = "You already created request, please wait not more than #{request_wait_time(UserRequest.find_by_user_id(current_user.id).created_at)}"
      end      
    else
      flash[:error] = "Please try later"         
    end    
    redirect_to :back
  end
end
