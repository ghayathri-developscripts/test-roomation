class ShareController < ApplicationController
  layout 'share'
  def show

    if user_signed_in?
        @user_id = User.find(params[:uid])
        @show_results = @user_id.style_poll.init_results_associations
        @face_title = @user_id.style_poll.style_quiz_result.name
        @face_desc = @user_id.style_poll.style_quiz_result.style_description
        @face_url = "http://www.roomations.com/share/show/#{@user_id.id}"
        image = @user_id.style_poll.questions.collect{ |question| question.photo }.take(1)
        @face_img = image.join(" ")
        #@image = @user_id.style_poll.questions.map{ |question| question.photo}
    else
        @style_poll = StylePoll.find(params[:uid])
        @show_results = @style_poll.init_results_associations
        @face_title = @style_poll.style_quiz_result.name
        @face_desc = @style_poll.style_quiz_result.style_description
        @face_url = "http://www.roomations.com/share/show/#{@style_poll.id}"
        image = @style_poll.questions.collect{ |question| question.photo }.take(1)
        @face_img = image.join(" ")
        binding.pry
    # end
    #style_poll = current_style_poll
    #@face_img = current_user.style_poll.style_poll_images(style_poll)
    #end
    end
  end
end