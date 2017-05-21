Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'products#index'
  # get "/" => 'products#index'
  get "/products", to: 'products#index'
  get "/products/new", to: 'products#new'
  post "/products", to: 'products#create'
  post "/products/search", to: 'products#search'
  get "/products/:id", to: 'products#show'
  get "/products/:id/edit", to: 'products#edit'
  patch "products/:id", to: 'products#update'
  delete "products/:id", to: 'products#destroy'
  ########ABOVE IS PRODUCTS ROUTES########
  ########BELOW IS SUPPLIER ROUTES########

  # get "/suppliers" => 'suppliers#index'


end
