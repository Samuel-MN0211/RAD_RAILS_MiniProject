# Exemplo de como seria um spec/models/ability_spec.rb

require 'rails_helper'
require 'cancan/matchers' # Importa os matchers do CanCanCan

RSpec.describe Ability, type: :model do
  describe 'Permissões' do
    context 'para um Aluno' do
      it 'pode fazer certas ações' do
        aluno = create(:user, :aluno)
        ability = Ability.new(aluno)
        
        # O aluno PODE ler uma oferta aprovada
        expect(ability).to be_able_to(:read, create(:oferta, status: :aprovada))
        
        # O aluno NÃO PODE ler uma oferta que é apenas uma proposta
        expect(ability).not_to be_able_to(:read, create(:oferta, status: :proposta))
        
        # O aluno NÃO PODE gerenciar tudo
        expect(ability).not_to be_able_to(:manage, :all)
      end
    end

    context 'para uma Empresa' do
      it 'pode gerenciar suas próprias ofertas' do
        empresa = create(:user, :empresa)
        ability = Ability.new(empresa)
        oferta_da_empresa = create(:oferta, user: empresa)
        outra_oferta = create(:oferta) # Criada por outra empresa

        # A empresa PODE gerenciar (editar, apagar) sua própria oferta
        expect(ability).to be_able_to(:manage, oferta_da_empresa)
        
        # A empresa NÃO PODE gerenciar a oferta de outra empresa
        expect(ability).not_to be_able_to(:manage, outra_oferta)
      end
    end

    context 'para um Coordenador' do
      it 'pode gerenciar tudo' do
        coordenador = create(:user, :coordenador)
        ability = Ability.new(coordenador)

        # O coordenador PODE gerenciar tudo
        expect(ability).to be_able_to(:manage, :all)
      end
    end
  end
end