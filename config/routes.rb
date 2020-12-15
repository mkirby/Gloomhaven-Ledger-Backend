Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :campaigns, only: [:index, :show, :create, :update]
      resources :parties, only: [:show, :create, :update]
      resources :characters, only: [:show, :create, :update]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/find_user_by_username', to: 'users#find_user_by_username'
    end
  end
  
end
