Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index]
  resources :users, only: [:show]
  root to: 'items#index'
end