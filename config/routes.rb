Rails.application.routes.draw do
  resources :stock_transfers
  resources :po_receipts
  resources :schools
  resources :po_items
  resources :purchase_orders
  get 'purchase_orders/fullfill/:id', to: 'purchase_orders#fullfill', as: 'fullfill_purchase_order'
  resources :employees
  resources :stocks
  resources :warehouses
  resources :suplies
  resources :budget_items
  root 'dashboard#index'
  devise_for :users, controllers: { sessions: 'users/sessions' }  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
