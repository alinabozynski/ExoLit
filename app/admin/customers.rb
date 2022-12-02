ActiveAdmin.register Customer do
  permit_params :username, :password, :city, :address, :postal_code

end
