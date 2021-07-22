Rails.application.routes.draw do
 
root to: "products#index"
resources :products do
  resources :orders, only: [:index, :new, :create]
end
  devise_for :users
end
