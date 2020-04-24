Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  root 'posts#index'
  resources :posts, only: [:new, :create, :index, :show, :destroy]
  resources :posts do
    resources :comments, only: [:create]
  end  
  resources :users, only: [:show]
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
