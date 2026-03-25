# Projeto 07 — Airflow — Primeira DAG

> Orquestre um pipeline de dados com Apache Airflow

## Contexto

Airflow e o orquestrador mais usado em engenharia de dados. Neste projeto, voce vai criar sua primeira DAG que orquestra um pipeline completo: extracao, transformacao e carga.

## Requisitos

1. Subir Airflow local com Docker (do projeto 06)
2. Criar uma DAG com pelo menos 4 tasks
3. Usar PythonOperator e BashOperator
4. Configurar dependencias entre tasks
5. Configurar schedule (ex: diario)
6. Implementar retries e tratamento de falhas
7. Usar XCom para passar dados entre tasks

## Criterios de Pronto

- [ ] DAG roda com sucesso no Airflow
- [ ] Schedule configurado e funcional
- [ ] Retries e error handling implementados
- [ ] Pipeline extrai, transforma e carrega dados

## Skills Praticadas

Apache Airflow, Python, DAGs, Operators, Scheduling, XCom

## Entregavel — GitHub Pages

GitHub Pages com visualizacao interativa da DAG — timeline de execucao simulada, status de cada task e grafo de dependencias.

Use o arquivo `PROMPT.md` para gerar sua pagina de portfolio para este projeto.

## Recursos

Acesse o [Roadmap Interativo](https://gc-data-academy.github.io/roadmap-data-engineering) e clique neste projeto para ver a lista completa de docs e videos recomendados.

## Estrutura

```
07-airflow-dag/
├── README.md        ← Voce esta aqui
├── PROMPT.md        ← Prompt para gerar o portfolio
├── solucao/         ← Codigo de referencia
└── dados/           ← Dados de exemplo
```

---

Feito com ☕ por [GC Data Academy](https://gc-data-academy.github.io/roadmap-data-engineering)
