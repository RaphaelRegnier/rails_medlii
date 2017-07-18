Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'


resources :users do
  resources :played_instruments, only: [:create, :destroy]
  get "add_instruments", to: "users#add_instruments"
end


mount Attachinary::Engine => "/attachinary"

end

