Rails.application.routes.draw do
  # Orders
  get 'orders', to: 'charges#orders'

  # Checkout
  resources :charges, only: [:new, :create]

  # Session Cart
  post 'charges/add_to_cart/:id', to: 'charges#add_to_cart', as: 'add_to_cart'
  get 'cart', to: 'charges#new'
  delete 'charges/remove_from_cart/:id', to: 'charges#remove_from_cart', as: 'remove_from_cart'
  post 'charges/change_quantity', to: 'charges#change_quantity', as: 'change_quantity'

  # Login and Registrations
  get '/sign_up' => 'customers#sign_up'
  post '/customers' => 'customers#create'
  get '/account' => 'customers#account'
  post '/update' => 'customers#update'

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Active Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Information
  get '/about&contact', to: 'components#about'

  # Products
  get '/', to: 'products#index'
  get 'products/:id', to: 'products#show', as: 'product'
  get '/search', to: 'products#search'
  get '/bestsellers', to: 'products#bestsellers'
  get '/cleansers', to: 'products#cleansers'
  get '/eye_care', to: 'products#eye_care'
  get '/face_mists', to: 'products#face_mists'
  get '/makeup_removers', to: 'products#makeup_removers'
  get '/masks', to: 'products#masks'
  get '/mini_sized', to: 'products#mini_sized'
  get '/moisturizers', to: 'products#moisturizers'
  get '/sets', to: 'products#sets'
  get '/skin_tools', to: 'products#skin_tools'
  get '/sunscreen', to: 'products#sunscreen'
  get '/treatments_serums', to: 'products#treatments_serums'
  get '/sales', to: 'products#on_sale'
  get '/new', to: 'products#new'
end
