Rails.application.routes.draw do
  
  root "welcome#home"
  resources :projects, only: [:new, :create, :show]
  resources :users, only: [:new, :create, :show]
  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create"
  match "/logout", to: "sessions#logout", via: [:get, :post]
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post], as: "git-login" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
