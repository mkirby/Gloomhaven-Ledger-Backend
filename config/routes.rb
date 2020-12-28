Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :campaigns, only: [:index, :show, :create, :update, :destroy]
      resources :parties, only: [:show, :create, :update, :destroy]
      resources :characters, only: [:show, :create, :update, :destroy]
      resources :character_classes, only: [:index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/find_user_by_username', to: 'users#find_user_by_username'
    end
  end
  
end
