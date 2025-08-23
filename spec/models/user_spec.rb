
require 'rails_helper'

RSpec.describe User, type: :model do


  describe 'Associações' do
  
    it { should have_many(:ofertas).dependent(:destroy) }
    it { should have_many(:candidaturas).dependent(:destroy) }
    it { should have_many(:habilidades).through(:aluno_habilidades) }
  end

  describe 'Validações Gerais' do

    subject { build(:user, :aluno) }

    it { should validate_presence_of(:nome).with_message("não pode ficar em branco.") }
    it { should validate_presence_of(:role) }
  end

  context 'quando o usuário é um Aluno' do

    subject { build(:user, :aluno) }

    it 'é válido com todos os atributos de aluno' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:data_nascimento).with_message("não pode ficar em branco.") }
    it { should validate_presence_of(:cpf).with_message("não pode ficar em branco.") }
    it { should validate_uniqueness_of(:cpf).case_insensitive.with_message("já cadastrado em nosso sistema.") }
    it { should allow_value('12345678901').for(:cpf) }
    it { should_not allow_value('12345').for(:cpf).with_message("deve conter exatamente 11 dígitos numéricos.") }
  end

  context 'quando o usuário é uma Empresa' do
    subject { build(:user, :empresa) }

    it 'é válido com todos os atributos de empresa' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:endereco).with_message("não pode ficar em branco.") }
    it { should validate_presence_of(:pessoa_contato).with_message("não pode ficar em branco.") }
    it { should validate_uniqueness_of(:cnpj).case_insensitive.with_message("já cadastrado em nosso sistema.") }
    it { should allow_value('12345678901234').for(:cnpj) }
    it { should_not allow_value('12345').for(:cnpj).with_message("deve conter exatamente 14 dígitos numéricos.") }
  end

  context 'quando o usuário é um Coordenador' do
    subject { build(:user, :coordenador) }

    it 'é válido com todos os atributos de coordenador' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:matricula).with_message("não pode ficar em branco.") }
    it { should validate_uniqueness_of(:matricula).case_insensitive.with_message("já cadastrada em nosso sistema.") }
    it { should allow_value('12345678').for(:matricula) }
    it { should_not allow_value('123').for(:matricula).with_message("deve conter exatamente 8 dígitos numéricos.") }
  end
end