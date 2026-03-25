# Projeto 03 — SQL: Primeiras Queries

> Aprenda SQL do zero analisando dados do Spotify: artistas, álbuns, músicas e playlists.

## 🎯 Objetivo

Ao final deste projeto, você terá:
- Um banco SQLite com 5 tabelas relacionadas
- 6 queries que respondem perguntas reais sobre os dados
- Entendimento de SELECT, WHERE, JOINs, GROUP BY e agregações
- Uma GitHub Pages com SQL Explorer interativo

## 📋 O que você precisa fazer

1. Criar um banco SQLite com o schema fornecido (artistas, álbuns, músicas, playlists)
2. Popular com os dados de exemplo (ou criar os seus)
3. Escrever 6 queries, cada uma respondendo uma pergunta:
   - Quais são os 10 artistas com mais seguidores?
   - Quantos álbuns cada artista lançou?
   - Qual a duração média das músicas por gênero?
   - Quais músicas explícitas têm popularidade acima de 80?
   - Qual artista tem a música mais popular?
   - Quais playlists têm mais de 50 músicas?
4. Testar todas as queries no SQLite
5. Gerar a GitHub Pages usando o PROMPT.md
6. Documentar o schema e as queries no README

## ✅ Critérios de Pronto

- [ ] Banco SQLite criado com 5 tabelas
- [ ] Dados populados (mínimo: 20 artistas, 40 álbuns, 100 músicas)
- [ ] 6 queries funcionando e retornando resultados corretos
- [ ] Cada query responde uma pergunta clara
- [ ] README documentando o schema e as queries
- [ ] GitHub Pages com SQL Explorer interativo

## 🛠 Skills Praticadas

SQL: CREATE TABLE, INSERT, SELECT, WHERE, ORDER BY, LIMIT, GROUP BY, HAVING, COUNT, SUM, AVG, MAX, MIN, INNER JOIN, aliases

## 🌐 Entregável — GitHub Pages

SQL Explorer interativo onde o visitante seleciona queries na sidebar, vê o código SQL com syntax highlight e os resultados em tabela.

**Abra o [PROMPT.md](PROMPT.md) e siga as instruções para gerar sua página com o Claude.**

## 💡 Dicas

**Instalando SQLite**
```bash
sqlite3 --version          # Mac/Linux já vem instalado
sqlite3 spotify.db         # Cria o banco e abre o terminal
```

**Criando tabelas**
```sql
CREATE TABLE artistas (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    pais TEXT,
    genero TEXT,
    seguidores INTEGER
);
```

**JOINs — combinando tabelas**
```sql
SELECT a.nome, COUNT(al.id) AS total_albuns
FROM artistas a
INNER JOIN albuns al ON a.id = al.artista_id
GROUP BY a.nome
ORDER BY total_albuns DESC;
```

**Rodando queries de arquivo**
```bash
sqlite3 spotify.db < queries/01-top-artistas.sql
```

## 📂 Estrutura

```
03-sql-primeiras-queries/
├── README.md        ← Você está aqui
├── PROMPT.md        ← Prompt para gerar a GitHub Pages
├── solucao/
│   ├── README.md    ← Passo a passo completo
│   ├── seed.sql     ← Schema + dados
│   ├── queries/     ← As 6 queries
│   └── index.html   ← SQL Explorer de exemplo
└── dados/
```

## 📚 Recursos

Acesse o [Roadmap Interativo](https://guicolla.github.io/roadmap-data-eng) e clique neste projeto para ver docs e vídeos recomendados.

---

Feito com ☕ por [GC Data Academy](https://guicolla.github.io/roadmap-data-eng)
