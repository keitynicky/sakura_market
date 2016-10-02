Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :products, only: [:show] do
    member {get :show_photo}
  end
  resource :cart, only: [:show] do 
    member {get :show_photo}
  end
  resources :order_items, only: [:create, :update, :destroy]
  root to: "products#index"
end

