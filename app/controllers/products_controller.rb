class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all.page(params[:page]).per(20)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    if params[:product][:category] == ''
      @products = Product.where("name LIKE ? OR details LIKE ?", "%" + params[:product_name] + "%", "%" + params[:product_name] + "%").all.page(params[:page]).per(20)
    else
      id = Category.select('id').where(:name => params[:product][:category]).first.id
      @products = Product.where("name LIKE ? OR details LIKE ?", "%" + params[:product_name] + "%", "%" + params[:product_name] + "%").where(:category_id => id).all.page(params[:page]).per(20)
    end
  end

  def cart
    @amount = 0
    @prices = []
    @product_ids = []
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

  def bestsellers
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Bestseller' }).page(params[:page]).per(20)
  end

  def cleansers
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Cleanser' }).page(params[:page]).per(20)
  end

  def eye_care
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Eye Care' }).page(params[:page]).per(20)
  end

  def face_mists
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Face Mist' }).page(params[:page]).per(20)
  end

  def makeup_removers
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Makeup Remover' }).page(params[:page]).per(20)
  end

  def masks
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Mask' }).page(params[:page]).per(20)
  end

  def mini_sized
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Mini Size' }).page(params[:page]).per(20)
  end

  def moisturizers
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Moisturizer' }).page(params[:page]).per(20)
  end

  def sets
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Set' }).page(params[:page]).per(20)
  end

  def skin_tools
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Skin Tool' }).page(params[:page]).per(20)
  end

  def sunscreen
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Sunscreen' }).page(params[:page]).per(20)
  end

  def treatments_serums
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Treatment & Serum' }).page(params[:page]).per(20)
  end

  def on_sale
    @all = Product.includes(:category).all
    @products = @all.where(:on_sale => true).page(params[:page]).per(20)
  end

  def new
    @all = Product.includes(:category).all
    @products = @all.where('created_at >= ?', DateTime.now-3.days).page(params[:page]).per(20)
  end
end
