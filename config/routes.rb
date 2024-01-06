Rails.application.routes.draw do
  resources :products, only: [:index, :show, :create]
  get 'store/inventory', to: 'inventories#index'
end
