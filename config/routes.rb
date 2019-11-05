Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#new'
  get 'users/calendar', to: 'users#calendar'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/myschedules', to: 'schedules#myschedules', defaults: {format: :json}
  get '/roomschedules/:id', to: 'schedules#roomschedules', defaults: {format: :json}
  
  resources :users
  resources :rooms
  resources :schedules
end
