Rails.application.routes.draw do
  root 'sessions#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  post '/sessions', to: 'sessions#create'

  resources :users, only: [:new, :create, :update, :destroy, :edit, :show]
  resources :swim_sessions, only: [:index, :show, :new, :create, :destroy]
  resources :circuits, only: [:index, :show]

end
