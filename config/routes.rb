Rails.application.routes.draw do
  resources :instruments
  root to: 'dashboards#show'
  # get '/member', to: 'dashboards#member'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  # attendance report route
  get '/users/attendance_report', to: 'users#attendance_report', as: "attendance_report"
  match '/users/attendance_report', to: 'users#attendance_report', via: [:get, :post]
  # pending user route
  get '/users/new_pending', to: 'users#new_pending', as: "new_pending"

  #gig master view
  get 'events/gig_master/:id', to: 'events#gig_master', as: 'gig_master'
  match '/events/gig_master/:id', to: 'events#gig_master', via: [:get, :post]

  resources :roles
  resources :storage_keys
  resources :event_types
  resources :rsvps
  resources :users
  resources :events

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
