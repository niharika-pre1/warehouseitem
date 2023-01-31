Rails.application.routes.draw do
  root "welcome#index"
  get 'dashboard/index'
  get 'shopkeepers/index'
  resources :supplier_products do
    member do
    post :add_item
    end
  end
  resources :shopkeeper_products do
    member do
    post :add_item
    end
  end
  resources :warehouse_products  do
    member do
    post :add_item
    end
  end
  resources :suppliers
  resources :warehouses 
  resources :users
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
