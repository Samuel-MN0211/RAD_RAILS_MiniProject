# spec/factories/candidaturas.rb

FactoryBot.define do
  factory :candidatura do
    # Associa esta candidatura a um usuário do tipo :aluno
    association :user, factory: [:user, :aluno]
    # Associa esta candidatura a uma :oferta
    association :oferta
    # Define o status padrão como :pendente
    status { :pendente }
  end
end