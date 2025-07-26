class EstagiosController < ApplicationController
  before_action :set_oferta
  before_action :authorize_create_estagio!, only: [:selecionar, :create]

  def selecionar
    @candidatos = @oferta.candidatos
  end

  def create
    if (params[:alunos_ids].blank?)
      flash.now[:alert] = "Selecione pelo menos um candidato."
      @candidatos = @oferta.candidatos
      return render :selecionar, status: :unprocessable_entity
    end

    if params[:data_inicio].blank? || params[:data_termino].blank? || params[:valor_bolsa].blank?
      flash.now[:alert] = "Preencha todos os campos do estágio."
      @candidatos = @oferta.candidatos
      return render :selecionar, status: :unprocessable_entity
    end

    @estagio = @oferta.build_estagio(estagio_params)

    ActiveRecord::Base.transaction do
      @estagio.save!
      params[:alunos_ids].each do |aluno_id|
        @estagio.estagio_alunos.create!(user_id: aluno_id)
      end
      @oferta.update!(status: :convertida)
    end

    redirect_to oferta_path(@oferta), notice: 'Oferta convertida em estágio com sucesso!'
  rescue => e
    flash.now[:alert] = "Erro: #{e.message}"
    @candidatos = @oferta.candidatos
    render :selecionar, status: :unprocessable_entity
  end

  private

  def set_oferta
    @oferta = Oferta.find(params[:oferta_id])
  end

  def authorize_create_estagio!
    authorize! :create, Estagio.new(oferta: @oferta)
  end

  def estagio_params
    params.permit(:data_inicio, :data_termino, :valor_bolsa)
  end
end
