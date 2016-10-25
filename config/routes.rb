Rails.application.routes.draw do
  get 'categories/new'

  get 'categories/edit'

  get 'categories/index'

  get 'categories/destroy'

  get 'categories/show'

    resources :products
    resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
