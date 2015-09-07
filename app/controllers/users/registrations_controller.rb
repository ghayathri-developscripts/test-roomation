class Users::RegistrationsController < Devise::RegistrationsController
  include StylePollsHelper
  
  def new
    super
  end

  def create
    super
    store_style_poll
  end

  def update
    super
  end
end 
