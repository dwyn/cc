Rails.application.routes.draw do

  root to: 'welcome#index'
  # get '/auth/github/callback' => 'sessions#create'

  

  resources :concepts
  resources :sections, only: [:index, :show]

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :users, only: [:show]
end