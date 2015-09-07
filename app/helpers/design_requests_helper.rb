module DesignRequestsHelper
  
  def style_assesment_last_group
    @design_request.style_poll.questions.size if @design_request
  end
  
  def question_answered? question
    @design_request.style_poll.questions.include?(question) if @design_request
  end

  def clear_session_values
    session[:design_request_id] = nil
    session[:visual_step_index] = nil
  end

  def displayable_discount_amount(discount)
    case discount.discount_type
    when Discount::TYPE_DOLLARS
      return number_to_currency discount.amount
    when Discount::TYPE_PERCENT
      return number_to_percentage discount.amount, precision: 0
    end
  end

  def get_request_package(request)
    if request.package.present?
      if request.package_id == 1
        return 'free'
      elsif request.package_id == 2 || request.package_id == 3 ||  request.package_id == 4
        return 'guide'
      elsif request.package_id == 5 || request.package_id == 6 ||  request.package_id == 7
        return 'show'
      end
    end
  end

end
