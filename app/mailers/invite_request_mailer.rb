class InviteRequestMailer < ActionMailer::Base

  default :from => "donotreply@roomations.com"

  def invite_request_confirmation(invite_request)
    @name = invite_request.name 
    mail(:to => invite_request.email, :subject => "Invite request to roomations")
  end

  def invite_request_notification(invite_request)
    @name = invite_request.name
    @resume = invite_request.resume.present? ? prepare_url(invite_request.resume.url) : invite_request.resume_web 
    @portfolio = invite_request.portfolio.present? ? prepare_url(invite_request.portfolio.url) : invite_request.portfolio_web
    @request_url = prepare_url admin_invite_request_path(invite_request)
    mail(:to => "katie@roomations.com", :subject => "New invite request has been created")
  end
  
  protected
  
  def prepare_url url
    return "http://roomations.com#{url}"
  end
  
end
