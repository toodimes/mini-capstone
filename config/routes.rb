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

  ########ABOVE IS SUPPLIER ROUTES########
  ########BELOW IS USER ROUTES########
  # get "/index" => "users#index"
  get "/signup", to: 'users#new'
  post "/users", to: 'users#create'
  get "/users/orders" => 'users#show'

  #log in /log out routes
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"

  get "/logout" => "sessions#destroy"

  #order routes
  get "/orders" => "orders#index"
  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"

  #categories routes
  get "/categories" => "categories#index"
  get "/categories/new" => "categories#new"
  post "/categories" => "categories#create"
  delete "/categories/:id" => "categories#destroy"

  #Carted Products Routes
  get "/cart" => "carted_products#index"
  post "/cart" => "carted_products#create"
  get "/cart/:id/remove" => "carted_products#update"

  patch "/cart/:id/edit" => "carted_products#edit"
  

end
