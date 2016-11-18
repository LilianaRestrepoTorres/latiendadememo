Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  resources :products
  resources :categories
  resources :purchases

  get 'profile' => 'pages#profile'
  get 'dashboard' => 'purchases#dashboard'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
