Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/', to: 'products#index'
  get 'products/:id', to: 'products#show', as: 'product'
  get '/about&contact', to: 'components#about'
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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
