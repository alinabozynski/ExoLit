class CustomersController < ApplicationController
  def login
  end

  def sign_up
    @usernames = []
    Customer.all.each do |c|
      @usernames.append(c.username)
    end

    @errors = []
    if @usernames.include? params[:username]
      @errors.append("Sorry, username already exists. Please choose another.")
    end
    if params[:password] != params[:password_confirmation]
      @errors.append("The password fields must match.")
    end
    if params[:password] == ''
      @errors.append("The password fields cannot be blank.")
    end

    if params[:postal]
      id = Province.where(:name => params[:customer][:province]).first.id
    end

    if @errors.length == 0
      new_customer = Customer.create(
        username: params[:username],
        password_hash: params[:password],
        password_salt: params[:password],
        city: params[:city],
        address: params[:address],
        postal_code: params[:postal],
        province_id: id
      )

      new_customer.errors.full_messages.each do |message|
        @errors.append(message)
      end
    end
  end
end