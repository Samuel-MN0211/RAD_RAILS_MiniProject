# Use a imagem oficial do Ruby.
FROM ruby:3.3.0-slim

# Instala dependências essenciais para o Rails e para compilar gems.
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libvips \
    sqlite3 \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho dentro do container.
WORKDIR /rails

# Expõe a porta que o Rails usará.
EXPOSE 3000

# O comando principal para iniciar o servidor.
# Este comando será sobrescrito pelo docker-compose.yml para maior flexibilidade.
CMD ["bin/rails", "server", "-b", "0.0.0.0"]