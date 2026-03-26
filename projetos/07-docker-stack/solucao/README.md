# Solução — Projeto 07: Docker Stack

Passo a passo completo. Quer tentar sozinho? Volte pro [README do projeto](../README.md).

---

## Passo 1 — Instalar Docker

**Windows/Mac:** Baixe o [Docker Desktop](https://www.docker.com/products/docker-desktop/)

**Linux:**
```bash
sudo apt update
sudo apt install docker.io docker-compose -y
sudo usermod -aG docker $USER
# Reinicie o terminal
```

Verifique:
```bash
docker --version
docker-compose --version
```

## Passo 2 — Configurar variáveis

```bash
cp .env.example .env
# Edite o .env se quiser mudar senhas
```

## Passo 3 — Subir a stack

```bash
docker-compose up -d
```

Aguarde ~30 segundos. Verifique:
```bash
docker-compose ps
# Deve mostrar 3 containers rodando: spotify-db, spotify-pgadmin, spotify-etl
```

## Passo 4 — Verificar os serviços

**PostgreSQL:**
```bash
docker exec -it spotify-db psql -U dataeng -d spotify -c "SELECT COUNT(*) FROM artistas;"
# Esperado: 10
```

**pgAdmin:** Abra `http://localhost:5050`
- Email: admin@admin.com
- Senha: admin123
- Adicione servidor: Host=postgres, Port=5432, User=dataeng, Password=dataeng123

**Logs do ETL:**
```bash
docker-compose logs etl
# Deve mostrar: [OK] Carga concluida! Artistas: 10, Musicas: 12
```

## Passo 5 — Explorar

```bash
# Entrar no container do Postgres
docker exec -it spotify-db psql -U dataeng -d spotify

# Queries
SELECT * FROM artistas ORDER BY seguidores DESC LIMIT 5;
SELECT m.titulo, a.nome, m.popularidade FROM musicas m JOIN artistas a ON m.artista_id = a.id ORDER BY m.popularidade DESC;

# Sair
\q
```

## Passo 6 — Derrubar

```bash
docker-compose down      # Para e remove containers
docker-compose down -v   # Também apaga volumes (dados)
```

## ✅ Checklist

- [ ] Docker instalado
- [ ] `docker-compose up -d` sobe 3 serviços
- [ ] pgAdmin acessível em localhost:5050
- [ ] Dados carregados no Postgres
- [ ] `docker-compose down` limpa tudo
- [ ] GitHub Pages com diagrama

---

Próximo: [08 — Airflow DAG](../../08-airflow-dag/)
