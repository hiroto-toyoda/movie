Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  root 'posts#index'
  resources :posts, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show]
end
