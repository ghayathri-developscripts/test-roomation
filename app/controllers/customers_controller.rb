class CustomersController < ApplicationController

  before_filter :require_recources

  def show
    if current_user.style_poll and current_user.style_poll.valid?
      @show_results = current_user.style_poll.init_results_associations
    end

    if current_user.style_poll.present?
    uri = URI.parse("http://graph.facebook.com")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data({"id" => "http://www.roomations.com/share/show/#{current_user.id}", "scrape" => "true"})
    response = http.request(request)
    end

  end

  def update
    data = params[:user].reject { |key, value| value.blank? && (key != "email_confirmation" || params[:user][:email].blank?) }

    if current_user.update_with_password(data)
      flash[:notice] = "Your data was successfully updated"
      redirect_to :action => "show"
    else
      render :action => "show"
    end
  end

  def retake_quiz
    current_user.style_poll.destroy if current_user.style_poll.present?
    redirect_to root_path
  end

  private

 def require_recources
b=[]
a=[]
     alldesigns= current_user.design_requests.order('updated_at desc') || []
     unless alldesigns.blank?
      alldesigns.each do |alldesign|
w=alldesign.projects
if w.blank?
  a<<alldesign
else
b<<alldesign
end
      end
     end
@projects=b
@design_requests=a
    #@design_requests = current_user.design_requests.order('updated_by desc') || []
  end

end
