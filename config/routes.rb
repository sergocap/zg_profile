Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  root 'welcome#index'
  resources :identities, only: [:index, :destroy]
  resource  :avatar,     only: [:edit, :update]
end
