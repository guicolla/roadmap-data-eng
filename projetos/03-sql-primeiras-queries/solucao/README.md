# Solução — Projeto 03: SQL Primeiras Queries

Passo a passo completo. Quer tentar sozinho? Volte pro [README do projeto](../README.md).

---

## Passo 1 — Criar o banco

```bash
sqlite3 spotify.db < seed.sql
```

Isso cria o banco com 5 tabelas e popula com dados.

## Passo 2 — Verificar os dados

```bash
sqlite3 spotify.db
```

```sql
.tables
-- artistas  albuns  musicas  playlists  playlist_musicas

SELECT COUNT(*) FROM artistas;    -- 20
SELECT COUNT(*) FROM albuns;      -- 40
SELECT COUNT(*) FROM musicas;     -- 100

.quit
```

## Passo 3 — Rodar as queries

```bash
# Uma por uma
sqlite3 spotify.db < queries/01-top-artistas.sql
sqlite3 spotify.db < queries/02-albuns-por-artista.sql
sqlite3 spotify.db < queries/03-duracao-por-genero.sql
sqlite3 spotify.db < queries/04-musicas-explicit-populares.sql
sqlite3 spotify.db < queries/05-musica-mais-popular.sql
sqlite3 spotify.db < queries/06-playlists-grandes.sql
```

## Passo 4 — Entender cada query

Leia os comentários nos arquivos `.sql`. Cada um explica os conceitos SQL usados.

## Passo 5 — Gerar a GitHub Pages

Siga o [PROMPT.md](../PROMPT.md) para gerar o SQL Explorer interativo.

## Passo 6 — Publicar

```bash
git add .
git commit -m "feat: SQL queries analisando dados do Spotify"
git push origin main
```

## ✅ Checklist

- [ ] Banco criado com 5 tabelas
- [ ] 6 queries funcionando
- [ ] README documentado
- [ ] GitHub Pages com SQL Explorer

---

Próximo: [04 — Linux + Shell](../../04-linux-shell-codespaces/)
