Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index]
  root to: 'items#index'
end