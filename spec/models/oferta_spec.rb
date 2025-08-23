

require 'rails_helper'

RSpec.describe Oferta, type: :model do

  subject { build(:oferta) }

  describe 'Associações' do
    it { should belong_to(:user) }
    it { should have_many(:candidaturas).dependent(:destroy) }
    it { should have_many(:candidatos).through(:candidaturas).source(:user) }
    it { should have_one(:estagio).dependent(:destroy) }
  end

  describe 'Validações de Presença' do
    it "é válido com atributos válidos" do
      expect(subject).to be_valid
    end


    it { should validate_presence_of(:titulo).with_message("não pode ficar em branco.") }
    it { should validate_presence_of(:descricao).with_message("não pode ficar em branco.") }
    it { should validate_presence_of(:atividade_principal).with_message("não pode ficar em branco.") }
    it { should validate_presence_of(:pre_requisitos).with_message("não pode ficar em branco.") }
    it { should validate_presence_of(:habilidades_necessarias).with_message("não pode ficar em branco.") }
    it { should validate_presence_of(:status).with_message("não pode ficar em branco.") }
  end

  describe 'Validações Numéricas' do
 
    it { should validate_presence_of(:ch_semanal).with_message("não pode ficar em branco.") }
    it { should validate_numericality_of(:ch_semanal).only_integer.with_message("deve ser um número de horas válido (entre 1 e 40).") }
    it { should validate_numericality_of(:ch_semanal).is_greater_than(0).with_message("deve ser um número de horas válido (entre 1 e 40).") }
    it { should validate_numericality_of(:ch_semanal).is_less_than_or_equal_to(40).with_message("deve ser um número de horas válido (entre 1 e 40).") }

    
    it { should validate_numericality_of(:valor_pago).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:vale_transporte).is_greater_than_or_equal_to(0) }
  end

  describe 'Enum de Status' do

    it do
      should define_enum_for(:status)
        .with_values(proposta: 0, aprovada: 1, reprovada: 2, cancelada: 3, convertida: 4)
    end
  end
end