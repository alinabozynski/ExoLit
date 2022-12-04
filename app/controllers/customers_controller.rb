class CustomersController < ApplicationController
  def sign_up
    @customer = Customer.new
  end

  def create
    @testing = custo_params
    @custo = Customer.new(custo_params)
    if @custo.save
      flash[:notice] = "You've successfully created an account!"
      session[:custo_id] = @custo.id
      redirect_to "/"
    else
      # Default error message
      flash[:alert] = "There was a problem signing up."

      # Custom error messages
      @usernames = []
      Customer.all.each do |c|
        @usernames.append(c.username)
      end
      if @usernames.include? params[:customer][:username]
        flash[:alert] = "Sorry, username already exists. Please choose another."
      end
      if params[:customer][:password] != params[:customer][:password_confirmation]
        flash[:alert] = "The password fields must match."
      end
      if params[:customer][:password] == ''
        flash[:alert] = "The password fields cannot be blank."
      end

      redirect_to '/sign_up'
    end
  end

  private

  def custo_params
    params.require(:customer).permit(:username, :password, :password_confirmation, :city, :address, :postal_code)
  end
end