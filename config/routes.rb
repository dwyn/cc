Rails.application.routes.draw do
  # get 'welcome/index'
  root 'welcome#index'

  resources :users, only: [:show]
  resources :concepts
  resources :sections, only: [:index, :show]

  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
end