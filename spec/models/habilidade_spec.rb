# spec/models/habilidade_spec.rb

require 'rails_helper' # Importa as configurações do Rails para o teste

# Descrevemos que este arquivo contém testes para o Model Habilidade
RSpec.describe Habilidade, type: :model do
  # Contexto para testar as associações do model
  describe 'Associações' do
    # O teste (it) espera que Habilidade TENHA MUITOS :aluno_habilidades
    # e que estes sejam destruídos se a habilidade for apagada.
    it { should have_many(:aluno_habilidades).dependent(:destroy) }

    # Espera que Habilidade TENHA MUITOS :alunos ATRAVÉS de :aluno_habilidades
    it { should have_many(:alunos).through(:aluno_habilidades) }
  end

  # Contexto para testar as validações
  describe 'Validações' do
    # O teste espera que Habilidade valide a PRESENÇA do atributo :nome
    it { should validate_presence_of(:nome) }

    # O teste espera que Habilidade valide que o :nome é ÚNICO (não pode haver duas habilidades com o mesmo nome)
    it { should validate_uniqueness_of(:nome) }
  end

  # Um contexto para testar a criação de uma instância válida
  context 'quando os atributos são válidos' do
    # O teste (it) verifica se uma Habilidade criada com a FactoryBot é válida
    it 'é válido' do
      habilidade = build(:habilidade) # Usaremos uma factory para criar o objeto
      expect(habilidade).to be_valid
    end
  end
end