Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create]
      post '/login', to: 'auth#create'
      post '/households', to: 'households#create'
      post '/profile', to: 'users#profile'
      
    end
  end
end
