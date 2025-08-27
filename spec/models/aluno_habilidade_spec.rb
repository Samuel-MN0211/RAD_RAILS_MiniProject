# spec/models/aluno_habilidade_spec.rb

require 'rails_helper'

RSpec.describe AlunoHabilidade, type: :model do
  describe 'Associações' do
    it { should belong_to(:user) }
    it { should belong_to(:habilidade) }
  end
end