Rails.application.routes.draw do
  devise_for :users

  resources :players, only: %i[index update] do
    get '/enable/:admin_id', to: 'players#enable',
        on: :collection
  end

  resources :masters, only: %i[index update] do
    get '/enable/:admin_id', to: 'masters#enable',
        on: :collection
  end

  resources :player_tables, only: [:destroy]

  resources :master_tables, only: [:destroy]

  resources :solicitations, only: %i[create destroy] do
    post '/:id/conclude/', to: 'solicitations#conclude', on: :collection
  end

  resources :tables do
    get '/users/:admin_id/', to: 'tables#user_tables', on: :collection
    get '/:id/users/:admin_id/solicitations',
        to: 'tables#table_solicitations',
        on: :collection
  end
end
