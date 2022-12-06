class ChargesController < ApplicationController
  def new
    @amount = 0
    @description = 'ExoLit Order'

    # Cart
    @prices = []
    @province = Province.where(:id => current_custo.province.id).first
    @taxes = []
  end

  def add_to_cart
    id = params[:id].to_i
    if session[:cart].map {|p| p['id'].to_i}.include? id
      quantity = session[:cart].select{|p| p['id'].to_i == id }[0]['quantity']
      session[:cart].detect{|p| p['id'].to_i == id }['quantity'] = quantity += 1
    else
      session[:cart].push("id" => id, "quantity" => 1)
    end

    flash[:notice] = "Item successfully added to cart."
    redirect_to(request.env['HTTP_REFERER'])
  end

  def change_quantity
    id = params[:id].to_i

    if params[:quantity].to_i == 0
      session[:cart].delete(session[:cart].detect{|p| p['id'].to_i == id })
      flash[:notice] = "The item was removed from the cart."
    else
      session[:cart].detect{|p| p['id'].to_i == id }['quantity'] = params[:quantity].to_i
      flash[:notice] = "Item quantity was successfully changed."
    end

    redirect_to(request.env['HTTP_REFERER'])
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(session[:cart].detect{|p| p['id'].to_i == id })
    flash[:notice] = "Item successfully removed from cart."
    redirect_to(request.env['HTTP_REFERER'])
  end

  def create
    @amount = amount

    @customer = Stripe::Customer.create(email: params[:stripeEmail],
                                        source: params[:stripeToken])

    @charge =Stripe::Charge.create(customer: @customer.id,
                                   amount: @amount,
                                   description: 'Rails Stripe Customer',
                                   currency: 'cad')

    # link site cutomer id to stripe customer id and:
    # if charge.paid && charge.amount == amount
    #   order = Order.create()
    # end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
