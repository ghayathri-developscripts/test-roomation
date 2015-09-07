module DesignersHelper
  
  def initialize_portfolio(designer)
    designer.build_photo_album(name: "Portfolio") if designer.photo_album.blank?
    designer.photo_album.photos.build
  end
  
  def clean_password_params
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
  end
  
end
