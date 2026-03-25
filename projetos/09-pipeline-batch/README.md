# Projeto 09 — Pipeline Batch Completo

> Integre tudo: API + Python + Airflow + dbt + SQLite

## Contexto

Projeto integrador da Fase 2. Voce vai construir um pipeline end-to-end que combina tudo o que aprendeu: extracao com Python, orquestracao com Airflow, transformacao com dbt e armazenamento em SQLite.

## Requisitos

1. Pipeline end-to-end funcional
2. Extracao de dados de API com Python
3. Orquestracao com Airflow (DAG com tasks)
4. Transformacao com dbt (staging → marts)
5. Armazenamento final em SQLite
6. Monitoramento e tratamento de erros
7. Documentacao completa do pipeline

## Criterios de Pronto

- [ ] Pipeline roda de ponta a ponta sem erros
- [ ] Dados fluem: API → Python → Airflow → dbt → SQLite
- [ ] Monitoramento e alertas configurados
- [ ] Documentacao completa

## Skills Praticadas

Python, Airflow, dbt, SQLite, integracao, monitoramento

## Entregavel — GitHub Pages

GitHub Pages com dashboard end-to-end mostrando cada etapa do pipeline, metricas e status de qualidade.

Use o arquivo `PROMPT.md` para gerar sua pagina de portfolio para este projeto.

## Recursos

Acesse o [Roadmap Interativo](https://gc-data-academy.github.io/roadmap-data-engineering) e clique neste projeto para ver a lista completa de docs e videos recomendados.

## Estrutura

```
09-pipeline-batch/
├── README.md        ← Voce esta aqui
├── PROMPT.md        ← Prompt para gerar o portfolio
├── solucao/         ← Codigo de referencia
└── dados/           ← Dados de exemplo
```

---

Feito com ☕ por [GC Data Academy](https://gc-data-academy.github.io/roadmap-data-engineering)
