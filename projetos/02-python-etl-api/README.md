# Projeto 02 — Python — ETL de API Publica

> Extraia dados de uma API REST, transforme com pandas e salve localmente

## Contexto

ETL (Extract, Transform, Load) e o coracao da engenharia de dados. Neste projeto, voce vai construir seu primeiro pipeline: extrair dados de uma API publica, transformar com Python/pandas e salvar em CSV e SQLite.

## Requisitos

1. Escolher uma API publica (ex: OpenWeatherMap, PokeAPI, IBGE)
2. Extrair dados usando a biblioteca requests
3. Parsear a resposta JSON
4. Transformar os dados com pandas (limpeza, renomear colunas, filtrar, agregar)
5. Salvar resultado em CSV e em SQLite
6. Tratar erros (API fora do ar, dados faltantes)
7. Documentar o pipeline no README

## Criterios de Pronto

- [ ] Script Python funcional que roda de ponta a ponta
- [ ] Dados salvos em CSV e SQLite
- [ ] Tratamento de erros implementado
- [ ] README documentando o pipeline

## Skills Praticadas

Python, requests, pandas, JSON, SQLite, tratamento de erros

## Entregavel — GitHub Pages

GitHub Pages com dashboard interativo mostrando os dados extraidos, codigo com syntax highlight e diagrama do fluxo ETL.

Use o arquivo `PROMPT.md` para gerar sua pagina de portfolio para este projeto.

## Recursos

Acesse o [Roadmap Interativo](https://gc-data-academy.github.io/roadmap-data-engineering) e clique neste projeto para ver a lista completa de docs e videos recomendados.

## Estrutura

```
02-python-etl-api/
├── README.md        ← Voce esta aqui
├── PROMPT.md        ← Prompt para gerar o portfolio
├── solucao/         ← Codigo de referencia
└── dados/           ← Dados de exemplo
```

---

Feito com ☕ por [GC Data Academy](https://gc-data-academy.github.io/roadmap-data-engineering)
