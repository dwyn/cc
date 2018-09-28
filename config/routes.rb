Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # get '/welcome/random_concept' => 'welcome#random_concept'
  get '/user/:id/concepts', to: 'concepts#index'

  resources :users, only: [:show] do
    resources :concepts
  end
end