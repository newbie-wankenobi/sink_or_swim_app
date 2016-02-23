Rails.application.routes.draw do
  root 'users#index'

  get 'sessions/new'

  get 'sessions/create'


  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
end
