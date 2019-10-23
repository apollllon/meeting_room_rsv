Rails.application.routes.draw do
  get 'sessions/new'

  root 'users#new'
  get 'users/calender', to: 'users#calender'
  get 'users/edit', to: 'users#edit'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'room/index', to: 'room#index'
  get 'room/new', to: 'room#new'
  get 'room/edit', to: 'room#edit'
  get 'room/show', to: 'room#show'

  resources :users

end
