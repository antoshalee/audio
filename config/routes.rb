Audio::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  resources :speakers do
  	collection { get :count }
  end

  resources :order_steps

  get 'profile', to: redirect('/orders/client')

  resources :orders, only: nil do
    collection do
      get :speaker
      get :client
    end
  	member do
      get :modal
      post :start
      post :deny_by_speaker
      post :ask_clarification
      post :clarify
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

  root to: "home#index"

end
