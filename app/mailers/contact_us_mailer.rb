class ContactUsMailer < ActionMailer::Base

  default :from => "donotreply@roomations.com"

  def send_message(message)
    @name = "#{message.first_name} #{message.last_name}"
    @email = message.email
    @msg = message.message
    mail(
      :to => configatron.contact_us.email, 
      :subject => configatron.contact_us.subject,
      :template_name => 'contact_us'
    )
  end

end
