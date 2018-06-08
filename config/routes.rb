Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :concepts do
    resources :sections
  end

  resources :users, only: [:show] do
    resources :concepts
  end
end