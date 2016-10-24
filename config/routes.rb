Rails.application.routes.draw do


  resources :rides

  resources :attractions

  resources :users

  resources :sessions

  root to: "application#index"

  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

end
