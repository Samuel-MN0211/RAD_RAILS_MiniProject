Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  devise_scope :user do
    authenticated :user do
      root to: 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :ofertas do
    resources :candidaturas, only: [:create]
    resources :estagios, only: [:index, :create] do
      collection do
        get :selecionar # Tela para selecionar candidatos
      end
    end
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