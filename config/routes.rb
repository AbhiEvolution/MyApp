Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root 'application#home'
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token
  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"
  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end
  get 'static_pages/home'
  resources :posts
end
