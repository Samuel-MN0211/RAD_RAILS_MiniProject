class Ofertum < ApplicationRecord
  belongs_to :user # A empresa que publicou

  has_many :candidaturas, dependent: :destroy
  has_many :candidatos, through: :candidaturas, source: :user
  has_one :estagio, dependent: :destroy

  validates :titulo, :descricao, :atividade_principal, :ch_semanal, :pre_requisitos, presence: true

  enum status: { disponivel: 0, cancelada: 1, convertida: 2 }
end