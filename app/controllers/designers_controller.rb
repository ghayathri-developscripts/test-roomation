class DesignersController < ApplicationController
 
 before_filter :authenticate_user, :only=>[:index]  
 before_filter :authenticate_current_designer, :only=>[:delete] 
  
 def update
    params['designer'].delete(:password) if params['designer'][:password].blank?
    params['designer'].delete(:password_confirmation) if params['designer'][:password_confirmation].blank?
    update!{ user_index_path}
  end
  
  def delete
    if params[:id]
      designer = Designer.find(params[:id]) rescue nil
      if designer
        designer.delete
        users = User.all.where('users.available_designers.include?("#{designer.id}")')
        users.each do |user|
          new_designers_list = user.available_designers.delete("#{designer.id}")
          user.update_attribute(:available_designers,new_designers_list)
        end          
      end
    end
    redirect_to :back
  end

  def check_user
    redirect_to variables_path unless current_user.admin?
  end
  
  def index 
    if current_user
      @designers = current_user.designers
    elsif current_admin
      @designers = Designer.paginate(:page => params[:page], :per_page => 20)
    end
  end
  
  def profile
    @designer = Designer.find(params[:id])    
  end
  
  def show
    @designer = Designer.find(params[:id])    
  end

end
