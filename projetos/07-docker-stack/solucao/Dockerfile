# === ETL Container — Spotify Data Loader ===
FROM python:3.11-slim

# Metadados
LABEL maintainer="GC Data Academy"
LABEL description="Carrega dados CSV no PostgreSQL"

# Diretório de trabalho
WORKDIR /app

# Instalar dependências primeiro (cache do Docker)
COPY scripts/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar código
COPY scripts/ .
COPY dados/ ./dados/

# Executar o script de carga
CMD ["python", "load.py"]
