class EstagiosController < ApplicationController
  before_action :set_oferta
  load_and_authorize_resource

  # GET /ofertas/:oferta_id/estagios/new
  def new
    @aluno = User.find(params[:aluno_id])
    @estagio = @oferta.build_estagio(user: @aluno)
  end

  # POST /ofertas/:oferta_id/estagios
  def create
    @estagio = @oferta.build_estagio(estagio_params)

    if @estagio.save
      @oferta.update(status: :convertida)
      redirect_to @oferta, notice: 'Oferta convertida em estágio com sucesso!'
    else
      @aluno = User.find(params[:estagio][:user_id])
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_oferta
    @oferta = Oferta.find(params[:oferta_id])
  end

  def estagio_params
    # Pega os dados do formulário e adiciona o user_id (aluno)
    params.require(:estagio).permit(:data_inicio, :data_termino, :valor_bolsa).merge(user_id: params[:estagio][:user_id])
  end
end