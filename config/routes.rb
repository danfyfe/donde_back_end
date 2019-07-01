Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create]

      post '/profile', to: 'users#profile'
      get '/users', to: 'users#index'


      post '/login', to: 'auth#create'
      post '/households', to: 'households#create'
      get '/households/:id', to:'households#show'
      get '/households', to: 'households#index'
      get '/messages/:id', to:'messages#household'
      get '/messages', to: 'messages#index'
      post '/messages', to: 'messages#create'
      get '/items', to: 'items#index'

      post '/spaces', to: 'spaces#create'
      get '/spaces/:id', to: 'spaces#show'
    end
  end
end
