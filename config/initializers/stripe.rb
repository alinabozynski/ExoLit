Stripe.api_key = Rails.application.credentials[:stripe][:secret]

# Rails.configuration.stripe = {
#  :publishable_key => 'pk_test_51MCRtXK4iGaCOeZLuh8eEFgpU4kAsTpumQAhj2DPhfbHC7XeGosdckJhl7wmsNz9hs9sYMhNqmiwtmjWNgwsUUcQ00K1oOEjE3', # ENV['PUBLISHABLE_KEY']
#  :secret_key      => 'sk_test_51MCRtXK4iGaCOeZLgVogw2KfQ6Q5TVwHF9wmqvHjyN595vGbOkRZjgPsprYqq76mJofUruF9Dts0nNRXt7atfe0A00Dy6zyYuy' # ENV['SECRET_KEY']
#}