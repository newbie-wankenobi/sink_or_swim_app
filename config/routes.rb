Rails.application.routes.draw do
  root 'users#index'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'


  get 'sessions/create'


  resources :users, only: [:new, :create, :update, :destroy, :edit, :show]
  resources :swim_sessions, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :circuits, only: [:index]
end
