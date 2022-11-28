# This file contains all the record creation needed to seed the database with values.
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/skincare.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

products.each do |product|
  category = Category.find_or_create_by(name: product['category'])

  Product.create(
  name: product['name'],
  details: product['details'],
  price: product['price'],
  on_sale: product['on_sale'],
  new: product['new'],
  category: Category.where(:name => category.name).first)
end