Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  devise_for :users
  resources :users
  resources :concepts
  resources :sections, only: [:index, :show]
end