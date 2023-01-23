Rails.application.routes.draw do
  get 'warehouse_products/index'
  get 'shopkeeper_products/index'
  get 'supplier_products/index'
  get 'products/index'
  root "warehouses#index"
  get 'shopkeepers/index'
  get 'suppliers/index'
 
  resources :supplier_products
  resources :products 
  
  post 'users/index' 
  resources :suppliers
  resources :warehouses do
  resources :warehouse_products
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end