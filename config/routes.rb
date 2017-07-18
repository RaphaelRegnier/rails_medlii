Rails.application.routes.draw do
  get 'users/show'

  get 'users/index'

  devise_for :users
  root to: 'pages#home'

resources :users do
  resources :played_instruments, only: [:create, :destroy]
end

get "users/:id/add_instruments", to: "users#add_instruments", as: :add_instruments
mount Attachinary::Engine => "/attachinary"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
