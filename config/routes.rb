Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # resources :concepts

  resources :users, only: [:show] do
    resources :concepts
  end

  post "/user/1/concepts/new" => "concepts#create"
  get 'favorites', to: 'users#favorites'
  
end