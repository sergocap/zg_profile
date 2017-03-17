Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  resources :messages, only: [:index, :destroy]
  root 'welcome#index'
  resources :identities, only: [:index, :destroy]
  resource  :avatar,     only: [:edit, :update]

  namespace :manage do
    root 'countries#index'
    resources :countries do
      resources :cities
    end
  end

  get 'api/send_mail'
  get 'api/get_users_id_by'
end
