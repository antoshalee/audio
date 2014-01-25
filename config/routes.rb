Audio::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  resources :speakers do
  	collection { get :count }
  end

  resources :order_steps
  root to: "home#index"

  get 'profile', to: 'orders#index', as: 'profile'

  resources :orders, only: nil do
  	member { get :modal }
  end

end
