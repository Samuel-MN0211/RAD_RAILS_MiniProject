class OfertasController < ApplicationController
  load_and_authorize_resource


  def index
    @ofertas_raw = Oferta.accessible_by(current_ability).order(created_at: :desc)
    @pagy, @ofertas = pagy(@ofertas_raw)
  end


  def show
  end


  def new
  end


  def edit
  end


  def create

    @oferta.user = current_user
    @oferta.status = :proposta

    if @oferta.save
      redirect_to oferta_path(@oferta), notice: "Proposta de estágio foi enviada para aprovação."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update

    if @oferta.update(oferta_params)
      redirect_to oferta_path(@oferta), notice: "Oferta de estágio foi atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy

    @oferta.cancelada!
    redirect_to ofertas_url, notice: "Oferta de estágio foi cancelada."
  end

  private


  def oferta_params
    params.require(:oferta).permit(:titulo, :descricao, :atividade_principal, :ch_semanal, :valor_pago, :vale_transporte, :pre_requisitos, :habilidades_necessarias, :habilidades_desejaveis)
  end
end