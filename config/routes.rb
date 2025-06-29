Rails.application.routes.draw do
  get "estagios/new"
  get "estagios/create"
  get "ofertas/index"
  get "ofertas/new"
  get "ofertas/create"
  get "ofertas/show"
  get "ofertas/edit"
  get "ofertas/update"
  get "ofertas/destroy"
  
  devise_for :users, controllers: { registrations: "users/registrations" }

  root "home#index"

  resources :ofertas do
    resources :candidaturas, only: [:create]
    resources :estagios, only: [:new, :create]
  end

  get 'dashboard', to: 'dashboard#index'

  namespace :coordenador do
    get "alunos/index"
    get "alunos/show"
    get "empresas/index"
    get "empresas/edit"
    get "empresas/update"
    root 'dashboard#index'
    
    resources :empresas, only: [:index, :edit, :update]
    

    resources :ofertas, only: [:index] do
      member do
        patch :aprovar
        patch :reprovar
      end
    end
    
    resources :estagios, only: [:index]
    resources :alunos, only: [:index, :show]
  end

end