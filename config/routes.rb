Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'home#index'
  resource :basket, only: %i(show)
  resource :charge, only: %i(create)

  resources :products, only: %i(index show new create) do
    scope module: :products do
      resources :add_to_baskets, only: %i(create) 
      resources :delete_in_baskets, only: %i(create)
    end
  end
  
  namespace :admins do
    root to: "dashboards#index"
    resources :products, only: %i(new create)
    end
end