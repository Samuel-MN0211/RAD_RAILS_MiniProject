class Estagio < ApplicationRecord
  belongs_to :user
  belongs_to :oferta

  validates :data_inicio, :data_termino, :valor_bolsa, presence: true
end