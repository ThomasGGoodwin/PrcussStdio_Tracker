Rails.application.routes.draw do
  resources :roles
  resources :storage_keys
  resources :event_types
  resources :sign_ins
  resources :users
  resources :events

  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
