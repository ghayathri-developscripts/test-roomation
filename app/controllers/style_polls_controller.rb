class StylePollsController < ApplicationController

  layout false

  def new
    @style_poll = StylePoll.new
    @questions_groups = Question.order('group_id ASC').group_by(&:group_id)
  end

  def create
    if user_signed_in?
      current_user.style_poll = StylePoll.new(params[:design_request][:style_poll_attributes])
      current_user.style_poll.init_results_associations
        uri = URI.parse("http://graph.facebook.com")
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data({"id" => "http://www.roomations.com/share/show/#{current_user.id}", "scrape" => "true"})
        response = http.request(request)
    else
       session[:style_poll] = params[:design_request][:style_poll_attributes]
       session[:need_show_style_results] = true
        uri = URI.parse("http://graph.facebook.com")
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data({"id" => "http://www.roomations.com/share/show/#{StylePoll.last.id}", "scrape" => "true"})
        response = http.request(request)

    end
  end
  
  def reveal
    @reveal = Reveal.new params[:reveal]
    if @reveal.save
      session[:need_show_style_results] = nil
      add_new_to_mail_chimp_group(@reveal)
    end
  end


  def add_new_to_mail_chimp_list(reveal)
    @list_id = "9fa7681952"
    gb = Gibbon::API.new
    gb.lists.subscribe({
        :id => @list_id,
        :email => {:email => reveal.email},
        :merge_vars => {:FNAME => "#{reveal.name}", :STYLE => "#{reveal.style_quiz}", :COLOR => "#{reveal.color_quiz}"},
        :double_optin => false
      })
  end

  def add_new_to_mail_chimp_group(reveal)
    @list_id = "4daad109bf"
    gb = Gibbon::API.new
    gb.lists.subscribe({
        :id => @list_id,
        :email => {:email => reveal.email},
        :double_optin => false,
        :merge_vars => {:FNAME => "#{reveal.name}", :MMERGE3 => "#{reveal.style_quiz}", :MMERGE4 => "#{reveal.color_quiz}", 
          :GROUPINGS => {0 => {'id' => 4105 ,:name => "Signed Up", :groups => ["Style Quiz"]}}
        }
      })
  end
  
end
