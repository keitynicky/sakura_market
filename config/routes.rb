Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :products, only: [:show] do
    member {get :show_photo}
  end
  resources :order_items, only: [:index, :create, :update, :destroy]
  resource :check_out, only: [:new, :create]
  root to: "products#index"
end

