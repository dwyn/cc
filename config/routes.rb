Rails.application.routes.draw do

  root to: 'welcome#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :concepts
  resources :sections, only: [:index, :show]

  resources :users, only: [:show]
end

#Nest sections under concepts