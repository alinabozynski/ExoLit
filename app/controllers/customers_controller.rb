class CustomersController < ApplicationController
  def sign_up
    @customer = Customer.new
  end

  def create
    if params[:customer][:province]
      province = Province.where(:id => params[:customer][:province]).first
    end
    @customer = Customer.new(customer_params)
    @customer.province = province

    # If the record is valid and is saved
    if @customer.save
      # Notify the user that their account has been created
      flash[:notice] = "You've successfully created an account!"
      # Set a session variable to their new account ID value
      session[:custo_id] = @customer.id

      # Redirect after submission
      redirect_to "/"
    else
      # Display error messages
      flash[:alert] = []
      @customer.errors.full_messages.each do |error|
        flash[:alert].append(error)
      end

      # Redirect after invalid submission
      redirect_to '/sign_up'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:username, :password, :password_confirmation, :city, :address, :postal_code)
  end
end