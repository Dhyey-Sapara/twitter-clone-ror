Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :user do
    #login routes
    get 'login', to: 'login#new', as: :login
    post 'login', to: 'login#create'
    delete 'logout', to: 'login#destroy'

    #registerations route
    get 'sign_up', to: 'registerations#new'
    post 'sign_up', to: 'registerations#create'
  end
end
