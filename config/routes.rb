Rails.application.routes.draw do
 root to: 'pages#home'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :played_instruments, only: [:create, :destroy, :new]
  #get "add_instruments", to: "users#add_instruments"

  resources :users, only: [:show, :index]

mount Attachinary::Engine => "/attachinary"

end

