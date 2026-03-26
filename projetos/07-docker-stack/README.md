# Projeto 07 — Docker: Stack Containerizada

> Monte um ambiente de dados completo com Docker Compose: PostgreSQL + pgAdmin + Python ETL.

## 🎯 Objetivo

Ao final deste projeto, você terá:
- Docker e Docker Compose instalados e funcionando
- Um `docker-compose.yml` com 3 serviços se comunicando
- Entendimento de containers, images, volumes e networks
- Um mini pipeline ETL rodando dentro de containers
- Uma GitHub Pages com diagrama interativo da arquitetura

## 📋 O que você precisa fazer

1. Instalar Docker e Docker Compose
2. Criar um `docker-compose.yml` com 3 serviços:
   - **PostgreSQL** — banco de dados
   - **pgAdmin** — interface web para gerenciar o banco
   - **ETL** — container Python que carrega dados no Postgres
3. Configurar:
   - Volumes para persistência do banco
   - Network para comunicação entre containers
   - `.env` para senhas e configurações
4. Criar um `Dockerfile` para o container ETL
5. Criar um script Python que carrega dados CSV no PostgreSQL
6. Testar: `docker-compose up` sobe tudo, `docker-compose down` derruba
7. Usar o PROMPT.md para gerar a GitHub Pages
8. Documentar no README

## ✅ Critérios de Pronto

- [ ] `docker-compose up -d` sobe os 3 serviços sem erros
- [ ] pgAdmin acessível em `localhost:5050`
- [ ] PostgreSQL acessível em `localhost:5432`
- [ ] Container ETL carrega dados CSV no Postgres
- [ ] Dados persistem entre restarts (volume configurado)
- [ ] `.env` com variáveis sensíveis (não commitado)
- [ ] `docker-compose down` limpa tudo
- [ ] README documentando como usar
- [ ] GitHub Pages com diagrama interativo

## 🛠 Skills Praticadas

Docker: images, containers, Dockerfile, docker-compose, volumes, networks, .env
DevOps: reprodutibilidade, isolamento, serviços, portas, health checks

## 🌐 Entregável — GitHub Pages

Diagrama interativo da arquitetura Docker — clique em cada container para ver portas, volumes, variáveis de ambiente e dependências. Inclui seção de código mostrando o `docker-compose.yml`.

**Abra o [PROMPT.md](PROMPT.md) e siga as instruções.**

## 💡 Dicas

**Instalar Docker**
- Windows/Mac: [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Linux: `sudo apt install docker.io docker-compose`

**Docker Compose básico**
```yaml
services:
  postgres:
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:
```

**Dockerfile básico**
```dockerfile
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "load.py"]
```

**Variáveis de ambiente**
Crie um `.env` (nunca commite!):
```
DB_PASSWORD=minha_senha_segura
DB_USER=dataeng
DB_NAME=spotify
```

**Comandos úteis**
```bash
docker-compose up -d        # Sobe tudo em background
docker-compose ps           # Lista containers rodando
docker-compose logs -f      # Acompanha logs
docker-compose down         # Para e remove
docker-compose down -v      # Para, remove e apaga volumes
```

## 📂 Estrutura

```
07-docker-stack/
├── README.md
├── PROMPT.md
├── solucao/
│   ├── README.md
│   ├── docker-compose.yml
│   ├── Dockerfile
│   ├── .env.example
│   ├── scripts/
│   │   ├── load.py           ← Script ETL
│   │   └── requirements.txt
│   ├── dados/
│   │   └── spotify_data.csv
│   └── index.html
└── dados/
```

## 📚 Recursos

Acesse o [Roadmap Interativo](https://guicolla.github.io/roadmap-data-eng) e clique neste projeto.

---

Feito com ☕ por [GC Data Academy](https://guicolla.github.io/roadmap-data-eng)
