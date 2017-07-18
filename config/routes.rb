Rails.application.routes.draw do
 root to: 'pages#home'
  
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
 

resources :users do
  resources :played_instruments, only: [:create, :destroy]
  get "add_instruments", to: "users#add_instruments"
end

mount Attachinary::Engine => "/attachinary"

end

