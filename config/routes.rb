Rails.application.routes.draw do
  resources :requests
  resources :receipts
  resources :accounts
  resources :games

  get "/login", to: "accounts#login"
  post "/login", to: "accounts#create_login"

  get "/logout", to: "accounts#logout"

  root "accounts#login"
  
  get "/respond", to: "requests#respond"

  post "/accept", to: "requests#accept"
  get "/accept", to: "requests#accept"

  post "/reject", to: "requests#reject"
  get "/reject", to: "requests#reject"

  get "/link_and_return", to: "receipts#link_and_return"
  post "/link_and_return", to: "receipts#link_and_return"
  
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
