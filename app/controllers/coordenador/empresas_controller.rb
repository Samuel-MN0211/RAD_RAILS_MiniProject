class Coordenador::EmpresasController < ApplicationController

  def index

    authorize! :index, User
    @empresas = User.empresa.order(:nome)
  end

  def edit
    @user = User.find(params[:id])
    authorize! :edit, @user
  end

  def update
    @user = User.find(params[:id])
    authorize! :update, @user
    
    if @user.update(empresa_params)
      redirect_to coordenador_empresas_path, notice: 'Empresa atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def empresa_params
    params.require(:user).permit(:nome, :cnpj, :endereco, :telefone, :email, :pessoa_contato, :atividade_principal, :url_empresa)
  end
end