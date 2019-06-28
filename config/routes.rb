Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create]
      post '/login', to: 'auth#create'
      post '/households', to: 'households#create'
      get '/households/:id', to:'households#show'
      get '/households', to: 'households#index'
      get '/messages/:id', to:'messages#household'
      get '/messages', to: 'messages#index'
      post '/messages', to: 'messages#create'
      post '/profile', to: 'users#profile'

    end
  end
end
