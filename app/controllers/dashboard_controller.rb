class DashboardController < ApplicationController
  before_action :authenticate_user!

  # GET /dashboard 
  def index
    @candidaturas_raw = current_user.candidaturas.includes(:oferta).order(created_at: :desc)
    @pagy, @candidaturas = pagy(@candidaturas_raw)
  end
end