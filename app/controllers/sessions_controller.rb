class SessionsController < ApplicationController
  def create
    @custo = Customer.authenticate(params[:username], params[:password])
    if @custo
      flash[:notice] = "You are now signed in."
      session[:custo_id] = @custo.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:custo_id] = nil
    flash[:notice] = "You are now signed out."
    redirect_to "/"
  end
end