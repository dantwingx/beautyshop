Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "health" => "health#check"

  namespace :api do
    namespace :v1 do
      # Authentication
      post '/register', to: 'auth#register'
      post '/login', to: 'auth#login'
      post '/social_login', to: 'auth#social_login'
      
      # Shops
      resources :shops do
        resources :services
        resources :stylists do
          member do
            get :available_times
          end
        end
      end
      
      # Bookings
      resources :bookings
    end
  end
end
