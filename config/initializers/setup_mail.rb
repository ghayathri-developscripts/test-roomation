ActionMailer::Base.default_url_options[:host] = "roomations.com"

ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "roomations.com",
  :user_name => "donotreply@roomations.com",
  :password => "DoNoTReply8743",
  :authentication => "plain",
  :enable_starttls_auto => true
}
