class InviteRequestsController < ApplicationController

  def index
  end
  
  def new
    @invite_request = InviteRequest.new
  end

  def create
    @invite_request = InviteRequest.new(params[:invite_request])
    if @invite_request.save
      InviteRequestMailer.invite_request_confirmation(@invite_request).deliver
      InviteRequestMailer.invite_request_notification(@invite_request).deliver
      flash[:notice] = "Your request was successfully created"
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

end
