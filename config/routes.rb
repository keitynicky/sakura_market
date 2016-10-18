Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :products, only: [:show] do
    member {get :show_photo}
  end
  resources :order_items, only: [:index, :create, :update, :destroy]
  resource :check_out, only: [:update] do
    member {get :user_info}
    member {put :update_user_info}
    member {get :delivery}
    member {get :confirm}
    member {get :complete}
  end
  root to: "products#index"
end

