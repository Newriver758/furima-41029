Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index]
end
