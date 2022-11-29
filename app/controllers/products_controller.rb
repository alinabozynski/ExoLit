class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all
  end

  def show
    @product = Product.find(params[:id])
  end

  def bestsellers
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Bestsellers' })
  end

  def cleansers
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Cleansers' })
  end

  def eye_care
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Eye Care' })
  end

  def face_mists
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Face Mists' })
  end

  def makeup_removers
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Makeup Removers' })
  end

  def masks
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Masks' })
  end

  def mini_sized
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Mini Size' })
  end

  def moisturizers
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Moisturizers' })
  end

  def sets
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Sets' })
  end

  def skin_tools
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Skin Tools' })
  end

  def sunscreen
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Sunscreen' })
  end

  def treatments_serums
    @all = Product.includes(:category).all
    @products = @all.where(:category => { :name => 'Treatments & Serums' })
  end
end
