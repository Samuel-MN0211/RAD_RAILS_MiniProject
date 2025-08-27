# spec/factories/habilidades.rb

FactoryBot.define do
  factory :habilidade do
    # A cada chamada, ele gera um nome de linguagem de programação único
    # usando a gem Faker, para evitar conflitos de unicidade.
    sequence(:nome) { |n| "#{Faker::ProgrammingLanguage.name} #{n}" }
  end
end