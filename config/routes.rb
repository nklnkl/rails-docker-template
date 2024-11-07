Rails.application.routes.draw do
  resources :user, defaults: { format: :json }
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "users", to: "users#show"
  get "users/sign_ins", to: "users#active_jwts"
  delete "users/sign_ins/:jti", to: "users#delete_jwt"
  delete "users/sign_ins", to: "users#delete_all_jwts"
end
