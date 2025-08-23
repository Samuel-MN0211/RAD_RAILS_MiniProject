class Oferta < ApplicationRecord
  self.table_name = "ofertas"
  belongs_to :user 

  has_many :candidaturas, dependent: :destroy
  has_many :candidatos, through: :candidaturas, source: :user
  has_one :estagio, dependent: :destroy


  validates :titulo, :descricao, :atividade_principal, :pre_requisitos, 
            :habilidades_necessarias, :status, presence: { message: "não pode ficar em branco." }


  validates :ch_semanal, 
            presence: { message: "não pode ficar em branco." },
            numericality: { 
              only_integer: true, 
              greater_than: 0, 
              less_than_or_equal_to: 40, 
              message: "deve ser um número de horas válido (entre 1 e 40)." 
            }


  validates :valor_pago, :vale_transporte, numericality: { greater_than_or_equal_to: 0, allow_nil: true }



  enum :status, { proposta: 0, aprovada: 1, reprovada: 2, cancelada: 3, convertida: 4 }
end