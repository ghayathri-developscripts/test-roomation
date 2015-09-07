module StylePollsHelper
  
  def store_style_poll
    if current_user && session[:style_poll]
      style_poll = StylePoll.new session[:style_poll]
      current_user.style_poll = style_poll if style_poll.valid?
      current_user.style_poll.init_results_associations
      current_user.style_poll.save!
        uri = URI.parse("http://graph.facebook.com")
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data({"id" => "http://www.roomations.com/share/show/#{current_user.id}", "scrape" => "true"})
        response = http.request(request)
    end
    session[:style_poll] = nil
  end

  def need_show_style?
    session[:need_show_style_results].present?
  end
  
  def clear_show_style
    session[:need_show_style_results] = nil
  end
  
  def session_style_poll_empty?
    session[:style_poll].nil?
  end

  def current_style_poll
    if session[:design_request_id]
      design_request = DesignRequest.find_by_id(session[:design_request_id])
      if design_request and design_request.style_poll and design_request.style_poll.valid?
        return design_request.style_poll
      end
    end
    
    if current_user and current_user.style_poll.present?
      current_user.style_poll
    elsif session[:style_poll]
      style_poll = StylePoll.new session[:style_poll]
      style_poll.init_results_associations
      return style_poll
    else
      nil
    end
  end

  def style_poll_images(style_poll)
    if style_poll.present?
      style_poll.questions.map{ |question| question.photo }
    else
      []
    end
  end
end
