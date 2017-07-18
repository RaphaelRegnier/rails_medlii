Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

resources :users do
  resources :played_instruments, only: [:create, :destroy]
  get "add_instruments", to: "users#add_instruments"
end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

