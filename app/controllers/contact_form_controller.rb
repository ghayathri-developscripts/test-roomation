class ContactFormController < ApplicationController

  def send_message
    message = ContactFormEmail.new(params[:contact_us])
    if message.save
      begin
      ContactUsMailer.send_message(message).deliver
        render :text => configatron.contact_us.message_sent, :status => :ok
      rescue
        render :text => configatron.contact_us.failed, :status => :bad_request
      end
    else
      render :text => configatron.contact_us.invalid_params, :status => :bad_request
    end
  end
  
end
