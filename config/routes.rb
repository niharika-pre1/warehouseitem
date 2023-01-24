Rails.application.routes.draw do
 
  root "warehouses#index"
  get 'shopkeepers/index'
  post 'shopkeepers/index'
 
  resources :supplier_products
  resources :products do
    member do
    post :add_item
    end
  end
  resources :shopkeeper_products
  resources :suppliers
  resources :warehouses 
  resources :warehouse_products
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
