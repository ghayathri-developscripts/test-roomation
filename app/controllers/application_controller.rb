class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_signed_in?
    true
  end
  
  def admin_only
    admin_signed_in?
  end

  def authenticate_admin
    unless admin_signed_in?
      flash.now[:error] = "Please, sign in"
      redirect_to "/admins/sign_in"       
    end
  end
  
  def authenticate_user
    unless user_signed_in? || admin_only
      flash.now[:error] = "Please, sign in"
      redirect_to "/"       
    end    
  end
  
  def authenticate_album_designer
    unless current_designer && current_designer.id == Album.find(params[:id]).designer_id || admin_only
      flash.now[:error] = "Sorry, you can't see this page"
      redirect_to "/"
    end
  end
  
  def authenticate_current_designer
    unless current_designer && current_designer.id == params[:id] || admin_only 
      flash.now[:error] = "Sorry, you can't see this page"
      redirect_to "/" 
    end
  end
  
  def request_wait_time(current_request)
    wait_time = 24.hours - (Time.now - current_request)  
    "#{(wait_time/3600).to_i} hours and #{(wait_time/60 - (wait_time/3600).to_i * 60).to_i} minutes"
  end

  def authenticate_domain_admin!
    redirect_to root_path unless signed_in? && current_user.is_role?(:admin)
  end
end

