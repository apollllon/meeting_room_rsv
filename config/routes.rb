Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#new'
  get 'users/calender', to: 'users#calender'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'rooms/:id/schedule', to: 'rooms#new_schedule'
  
  resources :users
  resources :rooms
  
end
