Audio::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  resources :speakers do
  	collection { get :count }
    member { post :toggle_favorite }
  end

  resources :order_steps

  get 'profile', to: redirect('/orders/client'), as: :profile

  get 'settings', to: redirect('/settings/account')
  %w(account speaker).each { |type|
    get   "settings/#{type}" => "settings##{type}"
    patch "settings/#{type}" => "settings##{type}"
  }

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

  resources :favorites, only: :index

  resources :demos do
    collection { post :cache }
  end

  resources :records do
    collection { post :cache }
    member { get :download }
  end

  root to: "home#index"

  get '/:url' => 'pages#show', :constraints => { :url => /.*/ }

end
