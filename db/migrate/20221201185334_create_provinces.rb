class CreateProvinces < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :pst
      t.string :gst
      t.string :hst

      t.timestamps
    end
  end
end
