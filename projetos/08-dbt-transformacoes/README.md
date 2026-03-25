# Projeto 08 — dbt — Transformacoes e Testes

> Transforme dados com dbt, escreva testes e gere documentacao automatica

## Contexto

dbt e a ferramenta padrao para transformacao de dados no data warehouse. Neste projeto, voce vai construir um projeto dbt completo com models em camadas, testes de qualidade e documentacao auto-gerada.

## Requisitos

1. Instalar dbt-core com adapter SQLite ou DuckDB
2. Criar models em 3 camadas: staging, intermediate, marts
3. Configurar sources no schema.yml
4. Escrever testes (unique, not_null, accepted_values, relationships)
5. Adicionar descricoes aos models e colunas
6. Gerar documentacao com dbt docs generate
7. Visualizar o lineage graph

## Criterios de Pronto

- [ ] Projeto dbt roda com dbt run sem erros
- [ ] Todos os testes passam com dbt test
- [ ] Documentacao gerada com descricoes
- [ ] Lineage graph mostra dependencias corretas

## Skills Praticadas

dbt, SQL, testes de dados, documentacao, lineage, YAML

## Entregavel — GitHub Pages

GitHub Pages com lineage graph interativo mostrando models, dependencias, testes e descricoes.

Use o arquivo `PROMPT.md` para gerar sua pagina de portfolio para este projeto.

## Recursos

Acesse o [Roadmap Interativo](https://gc-data-academy.github.io/roadmap-data-engineering) e clique neste projeto para ver a lista completa de docs e videos recomendados.

## Estrutura

```
08-dbt-transformacoes/
├── README.md        ← Voce esta aqui
├── PROMPT.md        ← Prompt para gerar o portfolio
├── solucao/         ← Codigo de referencia
└── dados/           ← Dados de exemplo
```

---

Feito com ☕ por [GC Data Academy](https://gc-data-academy.github.io/roadmap-data-engineering)
