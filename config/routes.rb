Rails.application.routes.draw do
  root to: 'dashboards#show'
  get '/member', to: 'dashboards#member'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  #attendance report route
  get '/users/attendance_report', to: 'users#report', as: 'attendance_report'

  #gig master view
  get 'events/gig_master/:id', to: 'events#gig_master', as: 'gig_master'

  resources :roles
  resources :storage_keys
  resources :event_types
  resources :rsvps
  resources :users
  resources :events

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
