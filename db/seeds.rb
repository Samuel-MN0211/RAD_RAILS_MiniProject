# db/seeds.rb


Habilidade.destroy_all

habilidades = [
  # Linguagens de Programação
  'Ruby on Rails',
  'Python (Django/Flask)',
  'JavaScript (Node.js/React/Vue)',
  'Java (Spring)',
  'PHP (Laravel)',
  'C# (.NET)',
  'Go',
  # Habilidades de Banco de Dados
  'SQL (PostgreSQL/MySQL)',
  'NoSQL (MongoDB)',
  # Habilidades de DevOps e Infraestrutura
  'Docker',
  'Git e GitHub',
  'CI/CD (Jenkins/GitLab CI)',
  # Habilidades de Desenvolvimento de Software
  'Desenvolvimento de Testes (TDD/BDD)',
  'Arquitetura de Microsserviços',
  'Design de UI/UX'
]

habilidades.each do |nome_habilidade|
  Habilidade.create!(nome: nome_habilidade)
end

puts "Seed concluído: #{Habilidade.count} habilidades criadas."