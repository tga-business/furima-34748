Rails.application.routes.draw do
 
root to: "products#index"
resources :products
    :orders
  devise_for :users
end
