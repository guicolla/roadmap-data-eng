# Projeto 12 — Pipeline Cloud Completo

> Pipeline de producao: GCS + Composer + dbt + BigQuery + Terraform

## Contexto

Projeto final! Voce vai construir um pipeline de producao completo na GCP: dados chegam no Cloud Storage, Cloud Composer (Airflow) orquestra, dbt transforma, BigQuery armazena. Toda infra provisionada via Terraform.

## Requisitos

1. Toda infraestrutura via Terraform
2. Ingestao de dados no Cloud Storage
3. Cloud Composer (Airflow) orquestrando o pipeline
4. dbt transformando dados no BigQuery
5. BigQuery como data warehouse final
6. CI/CD basico (GitHub Actions)
7. Monitoramento e alertas
8. Documentacao completa de arquitetura

## Criterios de Pronto

- [ ] Pipeline roda em producao no GCP
- [ ] Infra 100% via Terraform
- [ ] CI/CD configurado
- [ ] Documentacao de arquitetura completa

## Skills Praticadas

GCP, Cloud Composer, dbt, BigQuery, Terraform, CI/CD, GitHub Actions

## Entregavel — GitHub Pages

GitHub Pages com arquitetura interativa completa — clique em cada componente para ver detalhes e metricas.

Use o arquivo `PROMPT.md` para gerar sua pagina de portfolio para este projeto.

## Recursos

Acesse o [Roadmap Interativo](https://guicolla.github.io/roadmap-data-eng) e clique neste projeto para ver a lista completa de docs e videos recomendados.

## Estrutura

```
12-pipeline-cloud/
├── README.md        ← Voce esta aqui
├── PROMPT.md        ← Prompt para gerar o portfolio
├── solucao/         ← Codigo de referencia
└── dados/           ← Dados de exemplo
```

---

Feito com ☕ por [GC Data Academy](https://guicolla.github.io/roadmap-data-eng)
