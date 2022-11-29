class AddCategoryToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :category
  end
end
