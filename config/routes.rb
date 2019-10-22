Rails.application.routes.draw do
  root 'users#login_form'
  get 'users/calender', to: 'users#calender'
  get 'users/edit', to: 'users#edit'

  get 'room/index', to: 'room#index'
  get 'room/new', to: 'room#new'
  get 'room/edit', to: 'room#edit'
  get 'room/show', to: 'room#show'

  resources :users

end
