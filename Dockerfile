# Use a imagem oficial do Python 3.11, versão slim para um tamanho menor
FROM python:3.11-slim-buster  

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de requisitos para o diretório de trabalho
COPY requirements.txt . 

# Instala as dependências sem usar cache para uma instalação mais limpa
RUN pip install --no-cache-dir -r requirements.txt 

# Copia todo o código da aplicação para o diretório de trabalho
COPY . .  

# Expõe a porta 8000 para que a aplicação possa ser acessada externamente
EXPOSE 8000

# Define o comando para iniciar a aplicação usando Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
# e permite acesso externo na porta 8000