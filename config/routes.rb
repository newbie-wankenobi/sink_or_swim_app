Rails.application.routes.draw do
  root 'sessions#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'


  get 'sessions/create'


  resources :users, only: [:new, :create, :update, :destroy, :edit, :show]
  resources :swim_sessions, only: [:index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :circuits, only: [:index, :show]

  # resources :users, only: [:new, :create, :update, :destroy, :edit, :show] do
  #   resources :swim_sessions, only: [:index, :show]
  # end

end
