Rails.application.routes.draw do
  
  root :to => "welcome#home"
  resources :projects do 
    resources :project_features, as: "features"
  end

  resources :users, only: [:new, :create, :edit, :update, :show, :index]
   
  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create"
  match "/logout", to: "sessions#logout", via: [:get, :post]
  match '/auth/:provider/callback', to: 'sessions#git_goin', via: [:get, :post]

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
