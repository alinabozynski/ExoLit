class AddCustomerToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :customer
  end
end
