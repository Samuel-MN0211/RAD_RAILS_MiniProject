# db/seeds.rb
require 'faker'
require 'cpf_faker'

# Limpando tabelas
AlunoHabilidade.destroy_all
Habilidade.destroy_all
Candidatura.destroy_all
Estagio.destroy_all
Oferta.destroy_all
User.destroy_all

# ----------------------------
# Usuários
# ----------------------------
roles = [:aluno, :empresa]

User.create!(
  nome: "admin",
  email: "admin@gmail.com",
  password: "123456",
  role: :coordenador,
  data_nascimento: Faker::Date.birthday(min_age: 18, max_age: 35),
  cpf: Faker::CPF.numeric,
  matricula: Faker::Number.number(digits: 8)
)

50.times do
  role = roles.sample
  User.create!(
    nome: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "123456",
    role: role,
    data_nascimento: Faker::Date.birthday(min_age: 18, max_age: 35),
    cpf: Faker::CPF.numeric,
    cnpj: role == :empresa ? Faker::CNPJ.numeric : nil,
    telefone: role == :empresa ? Faker::Number.number(digits: 10) : nil,
    endereco: role == :empresa ? Faker::Address.full_address : nil,
    pessoa_contato: role == :empresa ? Faker::Name.name : nil,
    atividade_principal: role == :empresa ? Faker::Company.industry : nil,
    matricula: role == :coordenador ? Faker::Number.number(digits: 8) : nil
  )
end

alunos = User.where(role: :aluno)
empresas = User.where(role: :empresa)

# ----------------------------
# Habilidades
# ----------------------------
habilidades = [
  'Ruby on Rails',
  'Python (Django/Flask)',
  'JavaScript (Node.js/React/Vue)',
  'Java (Spring)',
  'PHP (Laravel)',
  'C# (.NET)',
  'Go',
  'SQL (PostgreSQL/MySQL)',
  'NoSQL (MongoDB)',
  'Docker',
  'Git e GitHub',
  'CI/CD (Jenkins/GitLab CI)',
  'Desenvolvimento de Testes (TDD/BDD)',
  'Arquitetura de Microsserviços',
  'Design de UI/UX'
]

habilidades_objects = habilidades.map { |nome| Habilidade.create!(nome: nome) }

# ----------------------------
# Aluno-Habilidades
# ----------------------------
alunos.each do |aluno|
  aluno.habilidades << habilidades_objects.sample(5)
end

# ----------------------------
# Ofertas
# ----------------------------
25.times do
  Oferta.create!(
    titulo: Faker::Job.title,
    descricao: Faker::Lorem.paragraph(sentence_count: 2),
    atividade_principal: Faker::Lorem.sentence,
    ch_semanal: [20, 30, 40].sample,
    valor_pago: Faker::Number.between(from: 1000, to: 5000),
    vale_transporte: Faker::Number.between(from: 100, to: 300),
    pre_requisitos: Faker::Lorem.words(number: 3).join(", "),
    habilidades_necessarias: habilidades_objects.sample(3).map(&:nome).join(", "),
    habilidades_desejaveis: habilidades_objects.sample(2).map(&:nome).join(", "),
    status: 0,
    user: empresas.sample
  )
end

ofertas = Oferta.all

# ----------------------------
# Estágios
# ----------------------------
ofertas.each do |oferta|
  Estagio.create!(
    data_inicio: Faker::Date.backward(days: 30),
    data_termino: Faker::Date.forward(days: 90),
    valor_bolsa: oferta.valor_pago,
    oferta: oferta
  )
end

# ----------------------------
# Candidaturas
# ----------------------------
combinacoes = alunos.to_a.product(ofertas).shuffle

combinacoes.first(25).each do |aluno, oferta|
  Candidatura.create!(
    user: aluno,
    oferta: oferta,
    status: [0, 1, 2].sample
  )
end

puts "Seeds concluídos:"
puts "Usuários: #{User.count}"
puts "Habilidades: #{Habilidade.count}"
puts "Ofertas: #{Oferta.count}"
puts "Estágios: #{Estagio.count}"
puts "Candidaturas: #{Candidatura.count}"
