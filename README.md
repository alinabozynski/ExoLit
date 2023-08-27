# ExoLit
Runs on localhost, port 3000

## Project Details and Gems
A formal proposal was written as a pitch to a fictional company to be selected to implement an e-commmerce side to their business. The proposal included:
* Fictional information such as business name, number of employees, how long the company has been in business, type of product, how products are currently sold, and target demographic
* Database structure including names of tables, why each table is required, column names and data types, description of associations between tables
* Entity Relationship Diagram that includes visualization of tracking customer related orders, ordering multiple different products, ordering a specific quantity of products, and being able to change a product's price without affecting past order totals.

* Bundler: 2.1.4
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
* Admin account to add, edit, and delete product listings, add/update images associated with new/existing products, create and maintain a list of product categories, and assign categories to new or existing products
* Search (can be categorized)
* Add products to cart (saved in session), where user can edit quantity of or remove items
* Sign up for a secure account (password are saved hashed and salted) with option to save address details right away to simplify future order
* Rails validations ensure content added by both administrators and customers is present and correctly formatted
* Accepts image uploads using Active Storage
* Proper taxes allocated at checkout as per province
* Payment acceptance implemented with Stripe
* Order summary upon checkout

## To test checkout with Stripe payment simulation, enter the following details:
* Email: any (for development purposes, email will not go through here)
* Card number: 4242 4242 4242 4242
* Expiry date: any valid future date
* CVC: any three-digit number

## To Run this Application

Run in Windows Subsystem for Linux (Ubuntu) with Ruby on Rails and rbenv installed.

Clone repository in WSL.

The master key file, which decrypts the Stripe credentials in this case, was not included in this repository for security reasons. The application will not run without, and since this application is not in production, I will provide it. Create a master.key file in /config and add the following contents:
```
42c4ed81acd47a870f9d2464c336e919
```

Run `rbenv install 2.7.6` to manage different Ruby versions when running the next commands.

Run `bundle install` to install all dependencies and gems.

Run `rails db:migrate` to migrate the database.

Run `rails db:seed` to populate the database.

Run `rails s` to start the server on your localhost, and navigate to the specified port.

Open localhost at port 3000 in the browser (http://127.0.0.1:3000)!

## Trouleshooting Help

* If there are any issues with with running rails db:migrate or rails db:seed, run `rails db:reset` before starting the server.
* If you are getting any net/protocol warnings, although they do not impact running the application, you can add `gem 'net-http'` to the Gemfile to get rid of them and run `bundle install` again.
