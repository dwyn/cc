Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # get 'favorites', to: 'users#favorites'
  get 'favorites', to: 'concepts#favorites'

  resources :users, only: [:show] do
    resources :concepts
  end
  # CURRENT ROUTES 
  #                         Prefix Verb     URI Pattern                                 Controller#Action
  #                           root GET      /                                           welcome#index
  #               new_user_session GET      /users/sign_in(.:format)                    devise/sessions#new
  #                   user_session POST     /users/sign_in(.:format)                    devise/sessions#create
  #           destroy_user_session GET      /users/sign_out(.:format)                   devise/sessions#destroy
  # user_github_omniauth_authorize GET|POST /users/auth/github(.:format)                callbacks#passthru
  #  user_github_omniauth_callback GET|POST /users/auth/github/callback(.:format)       callbacks#github
  #              new_user_password GET      /users/password/new(.:format)               devise/passwords#new
  #             edit_user_password GET      /users/password/edit(.:format)              devise/passwords#edit
  #                  user_password PATCH    /users/password(.:format)                   devise/passwords#update
  #                                PUT      /users/password(.:format)                   devise/passwords#update
  #                                POST     /users/password(.:format)                   devise/passwords#create
  #       cancel_user_registration GET      /users/cancel(.:format)                     devise/registrations#cancel
  #          new_user_registration GET      /users/sign_up(.:format)                    devise/registrations#new
  #         edit_user_registration GET      /users/edit(.:format)                       devise/registrations#edit
  #              user_registration PATCH    /users(.:format)                            devise/registrations#update
  #                                PUT      /users(.:format)                            devise/registrations#update
  #                                DELETE   /users(.:format)                            devise/registrations#destroy
  #                                POST     /users(.:format)                            devise/registrations#create
  #                  user_concepts GET      /users/:user_id/concepts(.:format)          concepts#index
  #                                POST     /users/:user_id/concepts(.:format)          concepts#create
  #               new_user_concept GET      /users/:user_id/concepts/new(.:format)      concepts#new
  #              edit_user_concept GET      /users/:user_id/concepts/:id/edit(.:format) concepts#edit
  #                   user_concept GET      /users/:user_id/concepts/:id(.:format)      concepts#show
  #                                PATCH    /users/:user_id/concepts/:id(.:format)      concepts#update
  #                                PUT      /users/:user_id/concepts/:id(.:format)      concepts#update
  #                                DELETE   /users/:user_id/concepts/:id(.:format)      concepts#destroy
  #                           user GET      /users/:id(.:format)                        users#show
  #                      favorites GET      /favorites(.:format)                        users#favorites
end