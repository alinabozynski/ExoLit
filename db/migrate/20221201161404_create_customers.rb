class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :password
      t.string :city
      t.string :addess
      t.string :postal_code

      t.timestamps
    end
  end
end
