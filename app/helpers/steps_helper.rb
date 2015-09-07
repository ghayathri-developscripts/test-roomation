module StepsHelper

  def header_of_state current_step_num, header_step_num, title
    if current_step_num > header_step_num
      content_tag(:span, link_to(title, '#', 'data-step' => title.downcase.gsub(' ', '_'), :class => "project_custom_step_link"), :id => "step-#{header_step_num}", :class => 'past' )
    elsif current_step_num == header_step_num
      content_tag(:span, title, :class => "current", :id => "step-#{header_step_num}")
    else
      content_tag(:span, title, :class => "future", :id => "step-#{header_step_num}")
    end
  end

  def header_for_state current_step_num, header_step_num, symbol

  end

  def get_step_header_number step_name
    case step_name
    when 1
      return '1'
    when 2, 3
      return '2'
    when 4, 5
      return '3'
    when 5
      return '4'
    when 6
      return '5'
    when 7, 8
      return '6'
    end
  end

  def step_header current_step
    current_step.gsub('_', ' ').capitalize
  end
  
  def current_visual_index
    session[:visual_step_index]
  end
  
end
