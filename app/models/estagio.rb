class Estagio < ApplicationRecord
  belongs_to :oferta
  has_many :estagio_alunos, dependent: :destroy
  has_many :alunos, through: :estagio_alunos, source: :user

  validates :data_inicio, :data_termino, :valor_bolsa, presence: true
end