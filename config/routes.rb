Rails.application.routes.draw do

  
  root 'application#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users/:id/dashboard', to: 'users#dashboard', as: "dashboard"

  #Omniauth
  get '/auth/:provider/callback', to: 'sessions#oauth_login'
  get '/auth/facebook', to: 'sessions#oauth_login'

  resources :users do
    resources :products, only: [:index, :new, :create]
  end

  resources :orders
  resources :cart_products
  resources :carts
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
