class Candidatura < ApplicationRecord
  belongs_to :user # O aluno que se candidatou
  belongs_to :oferta

  validates :user_id, uniqueness: { scope: :oferta_id, message: "Você já se candidatou a esta vaga." }

  enum status: { pendente: 0, aceita: 1, negada: 2 }
end
