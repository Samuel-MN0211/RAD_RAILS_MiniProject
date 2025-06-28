class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
  
    def select_role
      # Apenas renderiza a página de seleção
    end
  
    def new
      @habilidades = Habilidade.all if params[:role] == 'aluno'
      super
    end
  
    def create
      build_resource(sign_up_params)
  
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.aluno? && params[:user][:habilidade_ids].present?
          resource.habilidade_ids = params[:user][:habilidade_ids].reject(&:blank?)
        end
  
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        @habilidades = Habilidade.all if resource.aluno?
        respond_with resource
      end
    end
  
    protected
  
  
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [
        :nome, :cpf, :data_nascimento, :role,
        :cnpj, :endereco, :telefone, :pessoa_contato, :atividade_principal, :url_empresa,
        :matricula,
        { habilidade_ids: [] }
      ])
    end
  end