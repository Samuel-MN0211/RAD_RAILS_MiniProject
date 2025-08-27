# spec/models/estagio_spec.rb

require 'rails_helper'

RSpec.describe Estagio, type: :model do
  # Contexto para testar as associações
  describe 'Associações' do
    it { should belong_to(:oferta) }
    it { should have_many(:estagio_alunos).dependent(:destroy) }
    it { should have_many(:alunos).through(:estagio_alunos) }
  end

  # Contexto para testar as validações de presença
  describe 'Validações' do
    it { should validate_presence_of(:data_inicio) }
    it { should validate_presence_of(:data_termino) }
    it { should validate_presence_of(:valor_bolsa) }
  end
end