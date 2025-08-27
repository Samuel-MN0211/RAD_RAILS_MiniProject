# spec/models/estagio_aluno_spec.rb

require 'rails_helper'

RSpec.describe EstagioAluno, type: :model do
  describe 'Associações' do
    it { should belong_to(:estagio) }
    it { should belong_to(:user) }
  end
end