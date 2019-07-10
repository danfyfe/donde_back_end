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
      delete '/households/:user_id/:household_id', to: 'households#leave'

      # messages
      get '/messages/:id', to:'messages#household'
      get '/messages', to: 'messages#index'
      post '/messages', to: 'messages#create'

      # items
      get '/items/:id', to: 'items#show'
      get '/items', to: 'items#index'
      post '/items', to: 'items#create'
      patch '/items/:id', to: 'items#update'
      patch '/items/owners/:id', to: 'items#set_owners'
      delete '/items/:id', to: 'items#destroy'


      # spaces
      get '/spaces/:id', to: 'spaces#show'
      post '/spaces', to: 'spaces#create'
      patch '/spaces/:id', to: 'spaces#update'
      delete '/spaces/:id', to: 'spaces#destroy'

      #containers
      get '/containers/:id', to: 'containers#show'
      post '/containers', to: 'containers#create'
      patch '/containers/:id', to: 'containers#update'
      delete '/containers/:id', to: 'containers#destroy'

    end
  end
end
