Rails.application.routes.draw do
  root to: "places#index"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  
  resources :places do
    resources :entries, only: [:new, :create]
  end
end
