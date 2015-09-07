class MailchimpController < ApplicationController
	

	def subscribe
    	@list_id = "daeaad4ade"
    	gb = Gibbon::API.new
    	gb.lists.subscribe({
      		:id => @list_id,
      		:email => {:email => params[:email][:address]},
      		:double_optin => false
      	})
    	respond_to do |format|
		    format.html {redirect_to root_path}
		    flash[:alert] = "Thank you for Subscribing!"
		    # flash.keep(:alert) # Keep flash notice around for the redirect.
		    format.js 
		end
	end
end
