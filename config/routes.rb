Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :concepts, only: [:show] do
    resources :sections, only: [:index, :show]
  end

  resources :users, only: [:show] do
    resources :concepts, only: [:show, :index]
  end
end