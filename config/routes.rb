Rails.application.routes.draw do
  get 'users/calender'

  get 'users/edit'

  get 'room/index'

  get 'room/new'

  get 'room/edit'

  get 'room/show'

  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
