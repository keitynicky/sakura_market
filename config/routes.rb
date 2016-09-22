Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index]
  resource :user do
    resources :shopping_carts
  end
end
