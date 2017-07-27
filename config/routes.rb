Rails.application.routes.draw do
  get 'appointments/new'

  get 'appointments/create'

  get 'appointments/show'

  root to: 'pages#home'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  devise_for :users, only:[:create, :update],
    controllers: { registrations: 'registrations' }

  resources :played_instruments, only: [:create, :destroy, :new]
  #get "add_instruments", to: "users#add_instruments"

  resources :users, only: [:show, :edit, :index, :update]

  resources :appointments, only: [:new, :create, :show]

  resources :conversations do
    resources :messages, only: [:index, :new, :create, :destroy]
  end

  get '/conversations/:id/refresh_messages', to: 'conversations#refresh_messages', as: 'refresh_messages'
  # devise_for :users

  mount Attachinary::Engine => "/attachinary"

end
