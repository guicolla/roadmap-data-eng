# Projeto 09 — dbt: Transformações e Testes

> Transforme dados com dbt: models em camadas, testes de qualidade e documentação auto-gerada.

## 🎯 Objetivo

Ao final deste projeto, você terá:
- Um projeto dbt completo com models em 3 camadas (staging → intermediate → marts)
- Testes de qualidade (unique, not_null, accepted_values, relationships)
- Documentação auto-gerada com `dbt docs generate`
- Lineage graph mostrando dependências entre models
- Uma GitHub Pages com visualização interativa do lineage

## 🚀 Setup rápido

Use o template [airflow-dbt-starter](https://github.com/Gc-Data/airflow-dbt-starter) para ter dbt + PostgreSQL rodando em 2 minutos:

```bash
git clone https://github.com/Gc-Data/airflow-dbt-starter.git
cd airflow-dbt-starter
python setup.py
# Pronto! dbt + PostgreSQL + Airflow rodando
```

Ou instale dbt-core localmente:
```bash
pip install dbt-postgres
```

## 📋 O que você precisa fazer

1. Configurar o projeto dbt (usando o starter ou instalação local)
2. Criar **seeds** com dados do Spotify (CSVs que o dbt carrega no banco)
3. Criar **staging models** (views que limpam os dados brutos):
   - `stg_artistas` — artistas limpos e padronizados
   - `stg_musicas` — músicas com tipos corretos
   - `stg_streams` — streams com timestamps parseados
4. Criar **marts** (tabelas finais pra análise):
   - `dim_artistas` — dimensão artistas com métricas agregadas (total streams, média popularidade)
   - `fct_streams_diarios` — fato com streams por artista por dia
5. Configurar **testes** em `schema.yml`:
   - `unique` e `not_null` em todas as PKs
   - `accepted_values` em campos categóricos
   - `relationships` entre tabelas
6. Adicionar **descrições** nos models e colunas
7. Gerar docs: `dbt docs generate`
8. Usar o PROMPT.md para gerar a GitHub Pages
9. Documentar no README

## ✅ Critérios de Pronto

- [ ] `dbt run` executa sem erros
- [ ] `dbt test` — todos os testes passam
- [ ] Mínimo 2 staging models + 2 marts
- [ ] Mínimo 8 testes configurados
- [ ] Descrições em todos os models e colunas principais
- [ ] `dbt docs generate` funciona
- [ ] Lineage graph mostra dependências corretas
- [ ] README documentando o projeto
- [ ] GitHub Pages com lineage interativo

## 🛠 Skills Praticadas

dbt: models, materializations (view/table), sources, seeds, tests (generic + singular), docs, lineage, ref(), schema.yml, dbt_project.yml
SQL: CTEs, JOINs, agregações, CASE WHEN

## 🌐 Entregável — GitHub Pages

Lineage graph interativo mostrando: nodes dos models clicáveis, dependências com setas, código SQL de cada model, testes configurados e descrições.

**Abra o [PROMPT.md](PROMPT.md) e siga as instruções.**

## 💡 Dicas

**Estrutura de camadas**
```
seeds/          → CSVs carregados com dbt seed
staging/        → Views que limpam dados brutos (stg_*)
marts/          → Tabelas finais pra análise (dim_*, fct_*)
```

**Model básico (staging)**
```sql
-- models/staging/stg_artistas.sql
WITH source AS (
    SELECT * FROM {{ ref('artistas') }}  -- referencia o seed
)
SELECT
    id,
    LOWER(TRIM(nome)) AS nome,
    genero,
    seguidores
FROM source
WHERE nome IS NOT NULL
```

**Model mart com agregação**
```sql
-- models/marts/dim_artistas.sql
WITH streams AS (
    SELECT * FROM {{ ref('stg_streams') }}
),
artistas AS (
    SELECT * FROM {{ ref('stg_artistas') }}
)
SELECT
    a.id,
    a.nome,
    a.genero,
    COUNT(s.id) AS total_streams,
    ROUND(AVG(s.popularidade), 1) AS media_popularidade
FROM artistas a
LEFT JOIN streams s ON a.id = s.artista_id
GROUP BY a.id, a.nome, a.genero
```

**Testes no schema.yml**
```yaml
models:
  - name: stg_artistas
    description: "Artistas limpos e padronizados"
    columns:
      - name: id
        tests:
          - unique
          - not_null
      - name: genero
        tests:
          - accepted_values:
              values: ['Pop', 'Rock', 'Hip Hop', 'R&B', 'K-Pop', 'Reggaeton', 'Sertanejo']
```

**Comandos dbt essenciais**
```bash
dbt seed          # Carrega CSVs no banco
dbt run           # Executa os models
dbt test          # Roda os testes
dbt docs generate # Gera documentação
dbt docs serve    # Abre docs no browser (localhost:8080)
```

## 📂 Estrutura

```
09-dbt-transformacoes/
├── README.md
├── PROMPT.md
├── solucao/
│   ├── README.md
│   ├── dbt_project.yml
│   ├── profiles.yml
│   ├── seeds/
│   │   ├── artistas.csv
│   │   ├── musicas.csv
│   │   └── streams.csv
│   ├── models/
│   │   ├── staging/
│   │   │   ├── stg_artistas.sql
│   │   │   ├── stg_musicas.sql
│   │   │   ├── stg_streams.sql
│   │   │   └── schema.yml
│   │   └── marts/
│   │       ├── dim_artistas.sql
│   │       ├── fct_streams_diarios.sql
│   │       └── schema.yml
│   ├── tests/
│   │   └── assert_streams_positivos.sql
│   └── index.html
└── dados/
```

## 📚 Recursos

Acesse o [Roadmap Interativo](https://guicolla.github.io/roadmap-data-eng) e clique neste projeto.

---

Feito com ☕ por [GC Data Academy](https://guicolla.github.io/roadmap-data-eng)
