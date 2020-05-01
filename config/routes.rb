Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  
  resource :basket, only: %i(show)

  resources :products, only: %i(new create show) do
    scope module: :products do
      resources :add_to_baskets, only: %i(create)
      resources :delete_in_baskets, only: %i(create)
    end
  end
end