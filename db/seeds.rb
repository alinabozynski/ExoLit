# This file contains all the record creation needed to seed the database with values.
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

Product.destroy_all
Category.destroy_all
AdminUser.destroy_all
Province.destroy_all

csv_file = Rails.root.join('db/skincare.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

products.each do |product|
  category = Category.find_or_create_by(name: product[0])

  Product.create(
  name: product['name'],
  details: product['details'],
  price:
    if product['price'].match?(/\$\d+\.\d{2}/)
      product['price']
    else
      product['on_sale']
    end,
  on_sale:
    if product['on_sale'].match?(/\$\d+\.\d{2}/)
      true
    else
      false
    end,
  category: Category.where(:name => category.name).first)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

csv_file_province = Rails.root.join('db/provinces.csv')
csv_data_province = File.read(csv_file_province)

provinces = CSV.parse(csv_data_province, headers: true, encoding: 'iso-8859-1')

provinces.each do |province|
  Province.create(
  name: province[0],
  pst: province['pst'],
  gst: province['gst'],
  hst: province['hst'])
end