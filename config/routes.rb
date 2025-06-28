
Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: "users/registrations" }

  root "home#index"

  resources :ofertas do
    resources :candidaturas, only: [:create]
  end

  get 'dashboard', to: 'dashboard#index'

  namespace :coordenador do
    root 'dashboard#index'
    resources :empresas, only: [:index, :edit, :update]
    resources :ofertas, only: [:index]
    resources :estagios, only: [:index]
  end
end