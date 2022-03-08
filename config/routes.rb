Rails.application.routes.draw do
  root to: 'dashboards#show'
<<<<<<< HEAD

  get '/member', to: 'dashboards#set_roots'
=======
  get '/member', to: 'dashboards#member'
>>>>>>> test
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  #attendance report route
  get '/users/attendance_report', to: 'users#report', as: "attendance_report"

  resources :roles
  resources :storage_keys
  resources :event_types
  resources :rsvps
  resources :users
  resources :events

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
