Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root to: 'lessons#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'members#new'
  resources :members, only: [:show, :new, :create] 
  resources :lessons , only: [:index, :new, :create]  


  resources :favorites, only: [:create, :destroy]
end
