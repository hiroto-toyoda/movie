Rails.application.routes.draw do
  get 'pages/home'
  root 'posts#index'
  resources :posts, only: [:new, :create, :index]
end
