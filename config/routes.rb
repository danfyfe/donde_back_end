Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create]

      # user/auth
      get '/users', to: 'users#index'
      post '/profile', to: 'users#profile'
      post '/login', to: 'auth#create'

      # households
      get '/households/:id', to:'households#show'
      get '/households', to: 'households#index'
      post '/households', to: 'households#create'
      post '/households/:user_id/:household_id', to: 'households#join'
      patch '/households/:id', to: 'households#update'

      # messages
      get '/messages/:id', to:'messages#household'
      get '/messages', to: 'messages#index'
      post '/messages', to: 'messages#create'

      # items
      get '/items/:id', to: 'items#show'
      get '/items', to: 'items#index'


      # spaces
      get '/spaces/:id', to: 'spaces#show'
      post '/spaces', to: 'spaces#create'

    end
  end
end
