Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'

  resources :users do
    resources :profiles, only:[:new, :show, :edit, :create]
  end
end
