class EstagioAluno < ApplicationRecord
  belongs_to :estagio
  belongs_to :user
end
