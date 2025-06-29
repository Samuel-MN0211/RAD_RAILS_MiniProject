class Coordenador::OfertasController < ApplicationController


  def index
    @pagy_propostas, @ofertas_propostas = pagy(Oferta.proposta.order(created_at: :desc), name: 'propostas')
    @pagy_outras, @outras_ofertas = pagy(Oferta.where.not(status: :proposta).order(created_at: :desc), name: 'outras')
  end

  def aprovar
    @oferta = Oferta.find(params[:id])
    @oferta.aprovada! 
    redirect_to coordenador_ofertas_path, notice: "A proposta de estágio foi aprovada com sucesso."
  end

  def reprovar
    @oferta = Oferta.find(params[:id])
    @oferta.reprovada! 
    redirect_to coordenador_ofertas_path, notice: "A proposta de estágio foi reprovada."
  end
end