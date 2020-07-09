Rails.application.routes.draw do

  root 'application#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #Omniauth
  get '/auth/:provider/callback', to: 'sessions#oauth_login'
  get '/auth/facebook', to: 'sessions#oauth_login'

  

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
