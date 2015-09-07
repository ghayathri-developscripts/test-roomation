class UserMailer < ActionMailer::Base
 default :from => "info@roomations.com"
    def welcome(user) 
    	
    	mess=Article.find_by_title('signup')
    	@content=mess.body
    	@user = user.first_name
        @url = 'http://roomations.com'
       mail(:to => user.email, :subject => "Welcome to Roomations")
       
end
def password_reset(user)
       @user = user
       mail :to => user.email, :subject => "Password Reset"
    end
end