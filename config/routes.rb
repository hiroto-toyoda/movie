Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'
  resources :posts, only: [:new, :create]
end
