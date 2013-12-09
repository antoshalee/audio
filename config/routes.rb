Audio::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  resources :speakers
  root to: "home#index"
end
