class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { aluno: 0, empresa: 1, coordenador: 2 }


  has_many :ofertas, dependent: :destroy
  has_many :aluno_habilidades, dependent: :destroy
  has_many :habilidades, through: :aluno_habilidades
  has_many :candidaturas, dependent: :destroy
  has_many :ofertas_aplicadas, through: :candidaturas, source: :oferta
  has_many :estagio_alunos, dependent: :destroy
  has_many :estagios, through: :estagio_alunos

  #VALIDAÇÕES GERAIS 
  validates :role, presence: true
  validates :nome, presence: { message: "não pode ficar em branco." }
  # A validação de email e senha é feita pelo Devise


  # VALIDAÇÕES ESPECÍFICAS PARA O ALUNO 
  with_options if: :aluno? do |aluno|
    aluno.validates :data_nascimento, presence: { message: "não pode ficar em branco." }
    aluno.validates :cpf,
                      presence: { message: "não pode ficar em branco." },
                      uniqueness: { case_sensitive: false, message: "já cadastrado em nosso sistema." },
                      format: { with: /\A\d{11}\z/, message: "deve conter exatamente 11 dígitos numéricos." }
  end


  #VALIDAÇÕES ESPECÍFICAS PARA A EMPRESA
  with_options if: :empresa? do |empresa|
    empresa.validates :endereco, presence: { message: "não pode ficar em branco." }
    empresa.validates :pessoa_contato, presence: { message: "não pode ficar em branco." }
    empresa.validates :atividade_principal, presence: { message: "não pode ficar em branco." }
    empresa.validates :telefone,
                      presence: { message: "não pode ficar em branco." },
                      format: { with: /\A\d{10,11}\z/, message: "deve conter 10 ou 11 dígitos numéricos (com DDD)." }
    empresa.validates :cnpj,
                      presence: { message: "não pode ficar em branco." },
                      uniqueness: { case_sensitive: false, message: "já cadastrado em nosso sistema." },
                      format: { with: /\A\d{14}\z/, message: "deve conter exatamente 14 dígitos numéricos." }
  end


  # VALIDAÇÕES ESPECÍFICAS PARA O COORDENADOR 
  with_options if: :coordenador? do |coordenador|
    coordenador.validates :matricula,
                          presence: { message: "não pode ficar em branco." },
                          uniqueness: { case_sensitive: false, message: "já cadastrada em nosso sistema." },
                          format: { with: /\A\d{8}\z/, message: "deve conter exatamente 8 dígitos numéricos." }
  end
end