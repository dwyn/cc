Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  devise_for :users
  resources :users, only: [:show]
  resources :concepts
  resources :sections, only: [:index, :show]
end