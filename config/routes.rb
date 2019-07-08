Rails.application.routes.draw do
  devise_for :users

  resources :players, only: [:index]

  resources :masters, only: [:index]

  resources :tables do
    get '/users/:admin_id/',
        to: 'tables#user_tables',
        on: :collection
  end
end
