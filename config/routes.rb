Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [] do
    member {get :show_photo}
  end
  resource :user do
    resources :shopping_carts
  end
end
