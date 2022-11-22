Rails.application.routes.draw do
  resources :receipts
  resources :accounts
  resources :games

  get "/login", to: "accounts#login"
  post "/login", to: "accounts#create_login"

  get "/logout", to: "accounts#logout"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
