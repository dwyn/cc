Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  devise_for :users

  # resources :sections do
  #   resources :concepts, only: [:create, :show, :destroy, :index]
  # end
end
