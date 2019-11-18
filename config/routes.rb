Rails.application.routes.draw do

  root "sessions#new"
  get 'sessions/new', to: 'sessions#new', as: 'new_session'
  post 'sessions/create', to: 'sessions#create', as: 'create_session'
  post 'sessions', to: 'sessions#destroy', as: 'destroy_session'

  resources :creations, only:[:index, :show]

  resources :users do
    resources :creations, only:[:index, :show, :new, :edit, :create, :destroy]
    resources :profiles, only:[:new, :edit, :create]
  end

end
