Rails.application.routes.draw do
  devise_for :users

  resources :tables

  resources :players, only: [:index]

  resources :masters, only: [:index]

  resources :tables do
    get '/users/:admin_id/',
        action: :user_tables,
        controller: 'tables',
        on: :collection
  end
end
