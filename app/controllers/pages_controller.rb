class PagesController < ApplicationController

  layout 'terms', :only  => [:terms_of_use, :policy, :contractor_agreement]

  def how_it_works; end
  def pricing; end
  def about_us; end
  def faq; end
  def thank_you; end
  def gallery
    uri = URI.parse("http://www.slideshare.net/slideshow/embed_code/35931648?rel=0")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data({"id" => "http://www.slideshare.net/slideshow/embed_code/35931648?rel=0"})
    response = http.request(request)
    @render = response.body
  end
  def terms_of_use; end
  def policy; end
  def contractor_agreement; end
  
 
end
