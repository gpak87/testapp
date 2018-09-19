Rails.application.routes.draw do
  resources :posts
  resources :comments, only: [:index, :new, :create, :destroy]
  resources :users, only: [:index, :new, :create]

  get "/login", to: 'sessions#login'
  post "/attempt_login", to: 'sessions#attempt_login'
  get '/', to: 'sessions#index'
  get "/logout", to: 'sessions#logout'
  get "/new", to: 'users#new'
  # get '/comments', to: 'comments#index'
  # get '/comments/new', to: 'comments#new'
  # post '/comments', to: 'comments#create'
  # get '/comments/:user_id', to: 'comments#user_comments'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
