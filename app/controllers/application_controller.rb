class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :increment_visit_count, only: :index
  before_action :load_cart

  protect_from_forgery with: :exception
  helper_method :current_custo

  def current_custo
    if session[:custo_id]
      @current_custo ||= Customer.find(session[:custo_id])
    end
  end

  private

  def initialize_session
    # Initialize the visit_count on first visit
    session[:visit_count] ||= 0
    session[:cart] ||= []
    session[:product_ids] ||= []
  end

  def increment_visit_count
    # Increment the count with each visit
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

  def load_cart
    @cart = session[:cart]
  end
end