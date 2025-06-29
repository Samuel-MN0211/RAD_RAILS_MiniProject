class Coordenador::AlunosController < ApplicationController


  def index
    authorize! :index, User
    @alunos = User.aluno.includes(:candidaturas).order(:nome)
  end

  def show
    @user = User.find(params[:id])
    authorize! :show, @user
  end
end