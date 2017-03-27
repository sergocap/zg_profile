Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  resources :messages, only: [:index, :destroy]
  root 'welcome#index'
  resources :identities, only: [:index, :destroy]
  resource  :avatar,     only: [:edit, :update]

  namespace :manage do
    root 'users#index'
    resources :main_cities
    resources :users do
      get 'add_role', on: :member
      get 'delete_role', on: :member
    end
  end

  get 'api/send_mail'
  get 'api/get_users_id_by'
  get 'vk/get_countries'
  get 'vk/get_regions'
  get 'vk/get_cities'
end
