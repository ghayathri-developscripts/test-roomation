class Users::SessionsController < Devise::SessionsController
  include StylePollsHelper
  
  def new
    super
  end

  def create
    super
    store_style_poll
  end

end 
