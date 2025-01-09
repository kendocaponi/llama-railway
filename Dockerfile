FROM python:3.10-slim-buster

WORKDIR /app

# Instala dependencias del sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Instala Ollama
RUN curl -fsSL https://ollama.ai/install.sh | sh

# Copia los archivos del proyecto (si los tienes)
COPY . .

# Descarga el modelo Llama 3.1 (este es el cambio principal)
RUN ollama pull llama3.1 # O usa la versión específica: ollama pull llama3.1:8b

# Expone el puerto
EXPOSE 11434

# Comando para ejecutar Ollama (ajustado para Llama 3.1)
CMD ["ollama", "serve"] # ollama run llama3.1 no es necesario aqui, ollama serve ya carga el modelo