# ExoLit

## Project Details and Gems
A formal proposal was written as a pitch to a fictional company to be selected to implement an e-commmerce side to their business. The proposal included:
* Fictional information such as business name, number of employees, how long the company has been in business, type of product, how products are currently sold, and target demographic
* Database structure including names of tables, why each table is required, column names and data types, description of associations between tables
* Entity Relationship Diagram that includes visualization of tracking customer related orders, ordering multiple different products, ordering a specific quantity of products, and being able to change a product's price without affecting past order totals.

* Bundler: 2.3.23
* Ruby version: 2.7.1
* Rails: 7.0.4
* SQLite3: 1.4
* Puma: 5.0
* jbuilder
* stripe: for checkout payment
* kaminari: for pagination
* image_processing (1.2): for image resizing

ActiveAdmin gems:
* sassc-rails
* activeadmin
* devise

### Main project features
* Admin account to add, edit, and delete product listings, add/update images associated with new/existing products, edit contact and about page, create and maintain a list of product categories, and assign categories to new or existing products
* Search by category
* Add products to cart (saved in session) and edit quantity or remove items
* Sign up for a secure account (password are saved hashed and salted) with option to save address details to simplify future order
* Rails validations ensure content added by both administrators and customers is present and correctly formatted
* Accepts image uploads using Active Storage

## To Run this Application

Run in Windows Subsystem for Linux (Ubuntu) 

Clone repository in WSL.

Run `rbenv install 2.7.6` to manage different Ruby versions when running the next commands.

Run `bundle install` to install all dependencies and gems.

Run `bundle exec rake webpacker:install` to use Webpacker as the Rails wrapper with standard configuration.

Run `rails db:migrate` to migrate the database.

Run `rails db:seed` to populate the database.

Run `rails s` to start the server on your localhost, and navigate to the specified port.

Finally, once you see the "Yay! You're on Rails" screen, update URL to /admin/login to access ActiveAdmin and create customers for the database. Then, navigate to /customers to see who you have created!

## Trouleshooting Help

* IF server is displaying a Webpacker Manifest Missing Entry Error, and you have run `bundle exec rake webpacker:install`, then run `npm install` to ensure all dependencies and gems are installed and try again.
* If there are any issues with with running rails db:migrate or rails db:seed, run `rails db:reset` before starting the server.
