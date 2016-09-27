Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'products#index'
  resources :products, only: [] do
    member {get :show_photo}
  end
  resource :user do
    resources :shopping_carts
  end
end
