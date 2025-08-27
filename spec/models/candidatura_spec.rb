# spec/models/candidatura_spec.rb

require 'rails_helper'

RSpec.describe Candidatura, type: :model do
  # Descreve o que está sendo testado: o Model Candidatura

  # Contexto para testar as associações
  describe 'Associações' do
    # 'it' (ele) deve pertencer a um :user (aluno)
    it { should belong_to(:user) }
    # 'it' (ele) deve pertencer a uma :oferta
    it { should belong_to(:oferta) }
  end

  # Contexto para testar as validações
  describe 'Validações' do
    # Antes de cada teste neste bloco, crie uma candidatura
    # para podermos testar a regra de unicidade.
    subject { create(:candidatura) }

    # 'it' (ele) deve validar a unicidade do user_id no escopo de oferta_id.
    # Isso garante que um mesmo usuário não se candidate duas vezes na mesma oferta.
    it { should validate_uniqueness_of(:user_id).scoped_to(:oferta_id).with_message("Você já se candidatou a esta vaga.") }
  end

  # Contexto para testar o enum de status
  describe 'Enum de Status' do
    # 'it' (ele) deve definir um enum para :status com os valores esperados.
    it { should define_enum_for(:status).with_values(pendente: 0, aceita: 1, negada: 2) }
  end
end