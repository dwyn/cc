Rails.application.routes.draw do
  root to: 'welcome#index'
  
  resources :users, only: [:show] do
    resources :concepts
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
end
