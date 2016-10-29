Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  resources :products
  resources :categories
  resources :purchases

  get 'profile' => 'pages#profile'
  get 'dashboard' => 'purchases#dashboard'
end
