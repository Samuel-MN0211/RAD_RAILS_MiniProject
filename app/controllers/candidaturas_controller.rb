class CandidaturasController < ApplicationController
  before_action :authenticate_user!


  # POST /ofertas/:oferta_id/candidaturas
  def create

    @oferta = Oferta.find(params[:oferta_id])


    @candidatura = @oferta.candidaturas.build(user: current_user)
    @candidatura.status = :pendente

    authorize! :create, @candidatura

    if @candidatura.save
      redirect_to oferta_path(@oferta), notice: "Candidatura realizada com sucesso!"
    else
      redirect_to oferta_path(@oferta), alert: @candidatura.errors.full_messages.to_sentence
    end
  end
end