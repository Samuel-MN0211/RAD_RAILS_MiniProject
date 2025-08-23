
FactoryBot.define do
  factory :oferta do
    titulo { "Estágio em Desenvolvimento Web" }
    descricao { Faker::Lorem.paragraph }
    atividade_principal { "Desenvolver novas funcionalidades em Ruby on Rails." }
    ch_semanal { 30 }
    valor_pago { 1200.00 }
    vale_transporte { 150.00 }
    pre_requisitos { "Conhecimento em HTML, CSS e JavaScript." }
    habilidades_necessarias { "Ruby, Rails, Git" }
    status { :proposta }
    association :user, factory: [:user, :empresa]
  end
end