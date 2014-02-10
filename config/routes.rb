Audio::Application.routes.draw do
  get "records/cache"
  ActiveAdmin.routes(self)
  devise_for :users
  resources :speakers do
  	collection { get :count }
  end

  resources :order_steps
  root to: "home#index"

  get 'profile', to: 'orders#index', as: 'profile'

  resources :orders, only: nil do
  	member do
      get :modal
      post :start
      post :attach_record
      post :decline
      post :accept
    end
  end

  resources :demos do
    collection { post :cache }
  end

  resources :records do
    collection { post :cache }
  end


end
