class AddProvinceToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_reference :customers, :province
  end
end
