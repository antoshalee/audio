Audio::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  resources :speakers
  resources :order_steps
  root to: "home#index"
end
