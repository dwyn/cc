Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :concepts
  resources :sections, only: [:index, :show]

  devise_for :users
end