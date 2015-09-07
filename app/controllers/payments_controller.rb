class PaymentsController < ApplicationController
  include DesignRequestsHelper

  before_filter :authenticate_user!

  def new
    @design_request = DesignRequest.find_by_id(session[:design_request_id])
    @amount = calculate_amount
    
    @tr_data = Braintree::TransparentRedirect.transaction_data( 
      redirect_url: confirm_payment_url, 
      transaction: { 
        type: "sale",  
        amount: @amount, 
        options: {
          submit_for_settlement: true 
        }, 
        customer: { 
          first_name: current_user.first_name, 
          last_name: current_user.last_name, 
          email: current_user.email 
        } 
      })
  end

  def confirm
    @design_request = DesignRequest.find_by_id(session[:design_request_id])
    render action: "confirm" and return if @design_request.transaction

    @result = Braintree::TransparentRedirect.confirm(request.query_string)
    if @result.success?
      @transaction = Transaction.new(transaction_id: @result.transaction.id,
                                     amount: @result.transaction.amount,
                                     customer_first_name: @result.transaction.customer_details.first_name,
                                     customer_last_name: @result.transaction.customer_details.last_name,
                                     customer_email: @result.transaction.customer_details.email,
                                     credit_masked_number: @result.transaction.credit_card_details.masked_number,
                                     credit_card_type: @result.transaction.credit_card_details.card_type,
                                     design_request_id: @design_request.id)
      @transaction.save
      @design_request.transaction = @transaction
      render action: "confirm"
      @list_id = "978a4fd4c4"
      gb = Gibbon::API.new
      gb.lists.subscribe({
          :id => @list_id,
          :email => {:email => @result.transaction.customer_details.email},
          :double_optin => false,
          :merge_vars => {:FNAME => "#{@result.transaction.customer_details.first_name}", :LNAME => "#{@result.transaction.customer_details.last_name}"}
        })
    else
      @amount = calculate_amount
      render action: "new"
    end
  end

  def finish
    clear_session_values
    redirect_to root_url, notice: "Thanks for creating project."
  end

  protected

  def calculate_amount
    @design_request.total_amount
  end
end