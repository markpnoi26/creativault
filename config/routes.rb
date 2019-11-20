Rails.application.routes.draw do

  root "sessions#new"

  get 'sessions/new', to: 'sessions#new', as: 'new_session'
  post 'sessions/create', to: 'sessions#create', as: 'create_session'
  post 'sessions', to: 'sessions#destroy', as: 'destroy_session'

  resources :creations, only:[:index, :show]
  post 'creation/:id/loved', to: 'creations#update_heart_count', as: 'loved'
  post 'creation/:id/flagged', to: 'creations#update_flag_count', as: 'flagged'

  resources :users do
    resources :creations, only:[:index, :new, :create, :edit, :update, :destroy]
    resources :profiles, only:[:new, :edit, :create, :update]
  end

end
