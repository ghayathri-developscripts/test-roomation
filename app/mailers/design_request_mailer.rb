class DesignRequestMailer < ActionMailer::Base

  default :from => "donotreply@roomations.com"

  def remember_design_request(reveal, hash_code)
    @name = reveal.name
    @hash = hash_code
    mail(:to => reveal.email, :subject => "Saved design request")
  end
end
