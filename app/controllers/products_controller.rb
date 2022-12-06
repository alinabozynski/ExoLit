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
