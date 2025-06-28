class DashboardController < ApplicationController
  before_action :authenticate_user!

  # GET /dashboard 
  def index
    @candidaturas = current_user.candidaturas.includes(:oferta).order(created_at: :desc)
  end
end