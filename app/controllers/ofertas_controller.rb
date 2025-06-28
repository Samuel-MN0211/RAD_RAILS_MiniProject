class OfertasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_oferta, only: %i[ show edit update destroy ]

  # GET /ofertas
  def index
    # Se for empresa, mostra só as suas. Se for aluno, mostra todas.
    if current_user.empresa?
      @ofertas = current_user.ofertas.order(created_at: :desc)
    else
      @ofertas = Oferta.disponivel.order(created_at: :desc)
    end
  end

  # GET /ofertas/1
  def show
    # Apenas para o dono da oferta ou alunos/coordenador
  end

  # GET /ofertas/new
  def new
    @oferta = Oferta.new
  end

  # GET /ofertas/1/edit
  def edit
  end

  # POST /ofertas 
  def create
    @oferta = current_user.ofertas.build(oferta_params)
    @oferta.status = :disponivel

    if @oferta.save
      redirect_to @oferta, notice: "Oferta de estágio foi criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ofertas/1
  def update
    if @oferta.update(oferta_params)
      redirect_to @oferta, notice: "Oferta de estágio foi atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /ofertas/1 
  def destroy
    @oferta.update(status: :cancelada)
    redirect_to ofertas_url, notice: "Oferta de estágio foi cancelada."
  end

  private
    def set_oferta
      @oferta = Oferta.find(params[:id])
    end

    def oferta_params
      params.require(:oferta).permit(:titulo, :descricao, :atividade_principal, :ch_semanal, :valor_pago, :vale_transporte, :pre_requisitos, :habilidades_necessarias, :habilidades_desejaveis)
    end
end