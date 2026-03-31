# Solução — Projeto 09: dbt Transformações

Passo a passo. Quer tentar sozinho? Volte pro [README do projeto](../README.md).

---

## Passo 1 — Setup

**Opção A — Usando o airflow-dbt-starter (recomendado):**
```bash
git clone https://github.com/Gc-Data/airflow-dbt-starter.git
cd airflow-dbt-starter
python setup.py
# dbt já vem configurado e rodando
```

**Opção B — Instalação local:**
```bash
pip install dbt-postgres
# Configure profiles.yml com seu banco PostgreSQL
```

## Passo 2 — Carregar seeds

```bash
dbt seed
# Carrega artistas.csv, musicas.csv, streams.csv no banco
```

## Passo 3 — Executar models

```bash
dbt run
# Cria: stg_artistas, stg_musicas, stg_streams (views)
#        dim_artistas, fct_streams_diarios (tabelas)
```

## Passo 4 — Rodar testes

```bash
dbt test
# Roda todos os testes do schema.yml + tests/
# Esperado: 15+ testes passando
```

## Passo 5 — Gerar documentação

```bash
dbt docs generate
dbt docs serve
# Abre localhost:8080 com lineage graph e docs
```

## Passo 6 — Entender o lineage

```
seeds/artistas.csv ──→ stg_artistas ──→ dim_artistas
seeds/musicas.csv  ──→ stg_musicas  ──┘
seeds/streams.csv  ──→ stg_streams  ──→ fct_streams_diarios
                                    ──┘
```

## ✅ Checklist

- [ ] `dbt seed` carrega dados sem erros
- [ ] `dbt run` executa todos os models
- [ ] `dbt test` — todos os testes passam
- [ ] 3 staging + 2 marts models
- [ ] 15+ testes configurados
- [ ] Docs gerado com lineage
- [ ] GitHub Pages com lineage interativo

---

Próximo: [10 — Pipeline Batch Completo](../../10-pipeline-batch/)
