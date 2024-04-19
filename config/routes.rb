Rails.application.routes.draw do
  resources :tweets, except: %i[show]
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :user do
    #login routes
    get 'login', to: 'login#new', as: :login
    post 'login', to: 'login#create'
    delete 'logout', to: 'login#destroy'

    #registerations route
    get 'sign_up', to: 'registerations#new'
    post 'sign_up', to: 'registerations#create'

    get 'profile/:id', to: 'profile#show', as: 'profile'
    post 'follow', to: 'profile#follow'
    delete 'unfollow', to: 'profile#unfollow'
  end

  root "tweets#index"
end
