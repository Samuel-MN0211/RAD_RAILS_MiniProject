class Habilidade < ApplicationRecord
    has_many :aluno_habilidades, dependent: :destroy
    has_many :alunos, through: :aluno_habilidades, source: :user
  
    validates :nome, presence: true, uniqueness: true
  end