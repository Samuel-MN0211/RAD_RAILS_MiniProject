# spec/factories/estagios.rb

FactoryBot.define do
  factory :estagio do
    data_inicio { Date.today }
    data_termino { 6.months.from_now }
    valor_bolsa { 1500.00 }
    association :oferta
  end
end