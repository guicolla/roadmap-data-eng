# Projeto 06 — SQL: Análise Avançada

> CTEs, Window Functions e modelagem dimensional — evolua seu SQL com dados do Spotify.

## 🎯 Objetivo

Ao final deste projeto, você terá:
- Domínio de CTEs (WITH), Window Functions e subqueries
- Um banco modelado em star schema com tabela de streams
- 6 queries avançadas respondendo perguntas complexas de negócio
- Uma GitHub Pages com SQL Explorer avançado

## 📋 O que você precisa fazer

Este projeto expande o banco do [Projeto 03](../03-sql-primeiras-queries/). Você vai adicionar uma tabela de streams (histórico de reproduções) e escrever queries avançadas.

1. Executar o `seed.sql` que inclui todas as tabelas do P03 + tabela `streams`
2. Escrever 6 queries avançadas:
   - Q1: Ranking de artistas por total de streams (RANK)
   - Q2: Streams acumulados por dia (SUM OVER)
   - Q3: Comparar streams mês atual vs anterior por artista (LAG)
   - Q4: Top 3 músicas mais ouvidas por gênero (ROW_NUMBER + PARTITION BY)
   - Q5: Artistas com crescimento de streams mês a mês (CTE + cálculo)
   - Q6: Retenção de ouvintes — cohort mensal (CTE complexa)
3. Salvar cada query em arquivo `.sql` separado
4. Usar o PROMPT.md para gerar a GitHub Pages
5. Documentar no README

## ✅ Critérios de Pronto

- [ ] Banco expandido com tabela de streams (500+ registros)
- [ ] 6 queries avançadas funcionando
- [ ] Usa CTEs (WITH) em pelo menos 3 queries
- [ ] Usa Window Functions em pelo menos 3 queries
- [ ] Cada query responde uma pergunta de negócio
- [ ] README com explicação de cada conceito usado
- [ ] GitHub Pages com SQL Explorer avançado

## 🛠 Skills Praticadas

SQL avançado: CTEs (WITH), Window Functions (RANK, ROW_NUMBER, SUM OVER, LAG, LEAD, PARTITION BY), subqueries, modelagem star schema, DATE functions

## 🌐 Entregável — GitHub Pages

SQL Explorer avançado com: diagrama do star schema, queries selecionáveis com syntax highlight, botão executar e resultados mockados. Cada query tem uma explicação do conceito SQL usado.

**Abra o [PROMPT.md](PROMPT.md) e siga as instruções.**

## 💡 Dicas

**CTE (Common Table Expression)**
Uma query nomeada que você pode reusar:
```sql
WITH streams_por_artista AS (
    SELECT artista_id, COUNT(*) as total
    FROM streams s
    JOIN musicas m ON s.musica_id = m.id
    JOIN albuns al ON m.album_id = al.id
    GROUP BY artista_id
)
SELECT a.nome, spa.total
FROM streams_por_artista spa
JOIN artistas a ON a.id = spa.artista_id;
```

**Window Functions**
Calcula sobre um "grupo" sem colapsar as linhas:
```sql
-- Ranking sem perder as linhas individuais
SELECT nome, total_streams,
    RANK() OVER (ORDER BY total_streams DESC) as ranking
FROM artistas_streams;

-- Acumulado dia a dia
SELECT data, streams,
    SUM(streams) OVER (ORDER BY data) as acumulado
FROM streams_diarios;

-- Comparar com mês anterior
SELECT mes, streams,
    LAG(streams) OVER (ORDER BY mes) as mes_anterior
FROM streams_mensais;
```

**ROW_NUMBER + PARTITION BY**
Top N por grupo:
```sql
-- Top 3 músicas por gênero
SELECT * FROM (
    SELECT m.titulo, a.genero, COUNT(*) as streams,
        ROW_NUMBER() OVER (PARTITION BY a.genero ORDER BY COUNT(*) DESC) as rn
    FROM streams s
    JOIN musicas m ON s.musica_id = m.id
    GROUP BY m.titulo, a.genero
) WHERE rn <= 3;
```

## 📂 Estrutura

```
06-sql-analise-avancada/
├── README.md
├── PROMPT.md
├── solucao/
│   ├── README.md
│   ├── seed.sql           ← Banco completo (P03 + streams)
│   ├── queries/
│   │   ├── 01-ranking-artistas.sql
│   │   ├── 02-streams-acumulados.sql
│   │   ├── 03-comparar-meses.sql
│   │   ├── 04-top3-por-genero.sql
│   │   ├── 05-crescimento-artistas.sql
│   │   └── 06-cohort-retencao.sql
│   └── index.html
└── dados/
    └── spotify_advanced.db
```

## 📚 Recursos

Acesse o [Roadmap Interativo](https://guicolla.github.io/roadmap-data-eng) e clique neste projeto.

---

Feito com ☕ por [GC Data Academy](https://guicolla.github.io/roadmap-data-eng)
