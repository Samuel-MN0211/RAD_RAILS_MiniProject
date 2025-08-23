FactoryBot.define do
  factory :user do

    nome { Faker::Name.name }

    sequence(:email) { |n| "usuario#{n}@exemplo.com" }
    password { '123456' }
    password_confirmation { '123456' }
    role { :aluno }


    trait :aluno do
      role { :aluno }
      data_nascimento { Faker::Date.birthday(min_age: 18, max_age: 65) }
      sequence(:cpf) { |n| "111222333#{n.to_s.rjust(2, '0')}" }
    end


    trait :empresa do
      role { :empresa }
      nome { Faker::Company.name }
      endereco { Faker::Address.full_address }
      pessoa_contato { Faker::Name.name }
      atividade_principal { Faker::Company.industry }
      sequence(:telefone) { |n| "1198765#{n.to_s.rjust(4, '0')}" }
      sequence(:cnpj) { |n| "112223330001#{n.to_s.rjust(2, '0')}" }
    end


    trait :coordenador do
      role { :coordenador }
      sequence(:matricula) { |n| "202511#{n.to_s.rjust(2, '0')}" }
    end
  end
end