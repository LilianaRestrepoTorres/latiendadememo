Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :categories
  resources :purchases

  root 'pages#home'
end
