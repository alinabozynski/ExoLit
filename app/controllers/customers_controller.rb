class CustomersController < ApplicationController
  def login
  end

  def sign_up
    if params[:password] == '' || params[:password] != params[:password_confirmation]
      @password_error = "The password fields cannot be blank and must match!"
    else
      if params[:customer][:province] != ''
        id = Province.where(name: params[:customer][:province]).first.id
      end

      Customer.create(
        username: params[:username],
        password: params[:password],
        city: params[:city],
        address: params[:address],
        postal_code: params[:postal],
        province_id:
        if params[:customer][:province] != ''
          id
        end
      )
    end
  end
end
