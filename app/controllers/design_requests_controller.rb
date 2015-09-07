class DesignRequestsController < ApplicationController
  include Wicked::Wizard
  include DesignRequestsHelper

  layout 'application', :except => :remember

  steps :level_of_guidance, :style_assessment, :style_assessment_results, :my_room, :my_room_continued, :choose_designer, :registration, :checkout

  before_filter :require_design_request, :only  => [:show, :update, :remember, :input_discount, :retake_quiz,:save_project]
  before_filter :update_step, :only  => :show
  before_filter :load_resources, :only  => :show

  def index
    if params[:design] && @design_request = DesignRequest.find_by_design_hash(params[:design])  
      clear_session_values
      session[:design_request_id] = @design_request.id
      redirect_to wizard_path(@design_request.step)
    else
      flash :notice, "Design request wasn't found"
      redirect_to "show"
    end
  end
  
  def show
    case step
    when :level_of_guidance
    when :style_assessment
      if !@design_request.style_poll.valid? and current_user and current_user.style_poll and current_user.style_poll.valid?
        @design_request.style_poll = current_user.style_poll
        @design_request.save!
      end
      skip_step if @design_request.style_poll.valid?
    when :style_assessment_results
      if @design_request.package.title.eql?("Design Advice")
        session[:package_value] = @design_request.package.title
        @value = session[:package_value]
        @design_request.build_room if @design_request.room.nil?
          album_titles = [
            "Upload images of your room",
            "Upload images of items you currently have and would like to keep in your room",
            "Upload Pictures of Other Rooms In Your Home (optional)"
          ]
        if @design_request.room.photo_albums.empty?
          ["style_assessment_results", "my room"].each_with_index do |type, index| 
            new_album = @design_request.room.photo_albums.build(:name => type, :description => album_titles[index])
            new_album.photos.build
          end
        else
          @design_request.room.photo_albums.each { |album| album.photos.build if album.photos.empty? }
        end
      else
        if @design_request.style_poll and @design_request.style_poll.valid?
          @design_request.style_poll.init_results_associations
          @design_request.style_poll.save!
          if user_signed_in?
            uri = URI.parse("http://graph.facebook.com")
            http = Net::HTTP.new(uri.host, uri.port)
            request = Net::HTTP::Post.new(uri.request_uri)
            request.set_form_data({"id" => "http://www.roomations.com/share/show/#{current_user.id}", "scrape" => "true"})
            response = http.request(request)
          end
        else
          wizard_path(:style_assessment)
        end
      end      
      when :registration
        if current_user
          skip_step
        end
      when :checkout
        @design_request.update_attributes(user_id: current_user.id) if current_user
      end
      render_wizard
  end

  def new
    clear_session_values
    @design_request = DesignRequest.new
    @design_request.customer = current_user if user_signed_in?
    @design_request.design_hash = Digest::MD5.hexdigest("your_#{Time.now.to_i}_design")
    @design_request.save!
    session[:design_request_id] = @design_request.id
    redirect_to wizard_path(steps.first, :level  => params[:level])
  end

  def update
    if (params[:design_request].nil? and step.eql?(:style_assessment) and @design_request.style_poll.nil?)
      #do nothing
    elsif (@design_request.update_attributes(params[:design_request]))
      if step.eql?(:style_assessment) && current_user
        current_user.style_poll = @design_request.style_poll
      end
      session[:design_request_id] = @design_request.id
      if step.eql?(:style_assessment_results) && @design_request.package.title.eql?("Design Advice")
        redirect_to wizard_path(:registration) and return
      else
        skip_step # go to next step in wizard
      end
      if step.eql?(:checkout)
        redirect_to_finish_wizard and return
      else
        skip_step # go to next step in wizard
      end
    end
    load_resources
    render_wizard # render current step
  end

  def remember
    if user_signed_in?
      @reveal = Reveal.new(:name => current_user.full_name, :email => current_user.email)
    else
      @reveal = Reveal.create({:from => "design_request"}.merge params[:reveal])
    end
    add_to_mail_chimp_list(@reveal)
    # DesignRequestMailer.remember_design_request(@reveal, @design_request.design_hash).deliver
  end

  def input_discount
    @design_request.update_attributes(entered_discount_code: params[:discount][:discount_code])
    redirect_to wizard_path(:checkout)
  end

  def retake_quiz
    @design_request.style_poll.destroy if @design_request.style_poll
    redirect_to wizard_path(:style_assessment)
  end

  def save_project
    projects=Project.create(:user_id=>current_user.id,:status=>'received',:design_request_id=>@design_request.id)
    if current_user.is_role? :user
      redirect_to customer_path(current_user)
    end
    @list_id = "978a4fd4c4"
      gb = Gibbon::API.new
      gb.lists.subscribe({
          :id => @list_id,
          :email => {:email => current_user.email},
          :double_optin => false,
          :merge_vars => {:FNAME => "#{current_user.first_name}", :LNAME => "#{current_user.last_name}"}
        })
  end

  private

  def add_to_mail_chimp_list(reveal)
    @list_id = "064e69d54e"
    gb = Gibbon::API.new
    gb.lists.subscribe({
        :id => @list_id,
        :email => {:email => reveal.email},
        :merge_vars => {:FNAME => "#{reveal.name}", :DESIGNID => "#{@design_request.design_hash}"},
        :double_optin => false
      })
  end

  def redirect_to_finish_wizard
   clear_session_values
   redirect_to root_url, notice: "Thanks for creating project."
  end

  def update_step
    @design_request.disable_validation
    @design_request.update_attributes(:step => step.to_s)
    update_visual_step_index
  end

  def load_resources
    case step
    when :level_of_guidance
      @packages = Package.all
    when :style_assessment
      @design_request.build_style_poll if @design_request.style_poll.nil?
      @questions_groups = Question.all.group_by(&:group_id)
    when :my_room
      @design_request.build_room if @design_request.room.nil?
      album_titles = [
        "Upload images of your room",
        "Upload images of items you currently have and would like to keep in your room",
        "Upload Pictures of Other Rooms In Your Home (optional)"
      ]
      if @design_request.room.photo_albums.empty?
        ["my room", "items", "other rooms"].each_with_index do |type, index| 
          new_album = @design_request.room.photo_albums.build(:name => type, :description => album_titles[index])
          new_album.photos.build
        end
      else
        @design_request.room.photo_albums.each { |album| album.photos.build if album.photos.empty? }
      end
    when :choose_designer
         @designers = User.active_designers
    end
  end

  def require_design_request
    @design_request = session[:design_request_id].blank? ? DesignRequest.last : DesignRequest.find(session[:design_request_id])
  end
  
  def update_visual_step_index
    session[:visual_step_index] = @design_request.visual_step_index if session[:visual_step_index].nil? or session[:visual_step_index] < @design_request.visual_step_index
  end
end
