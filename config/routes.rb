Rails.application.routes.draw do
  devise_for :users

  resources :tables

  resources :players, only: [:index]
end
