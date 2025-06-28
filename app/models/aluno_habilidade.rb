class AlunoHabilidade < ApplicationRecord
  belongs_to :user
  belongs_to :habilidade
end