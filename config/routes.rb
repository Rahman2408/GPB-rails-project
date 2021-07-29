Rails.application.routes.draw do
  
  root 'welcome#home'
  resources :projects, only: [:new, :create, :show]
  resources :users, only: [:new, :create, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
