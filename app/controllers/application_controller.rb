class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_custo

  def current_custo
    if session[:custo_id]
      @current_custo ||= Customer.find(session[:custo_id])
    end
  end
end