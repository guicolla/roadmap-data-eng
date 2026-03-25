# Projeto 06 — Docker — Stack Containerizada

> Monte um ambiente local completo de dados com Docker Compose

## Contexto

Docker garante que seu ambiente roda igual em qualquer maquina. Neste projeto, voce vai containerizar uma stack completa de dados: banco de dados, orquestrador e notebook, tudo com Docker Compose.

## Requisitos

1. Escrever um Dockerfile customizado
2. Criar um docker-compose.yml com 3+ servicos (ex: PostgreSQL + Airflow + Jupyter)
3. Configurar volumes para persistencia de dados
4. Configurar networks para comunicacao entre servicos
5. Documentar como subir e derrubar a stack
6. Criar um .env para variaveis sensiveis

## Criterios de Pronto

- [ ] docker-compose up funciona de primeira
- [ ] Todos os servicos se comunicam
- [ ] Dados persistem entre restarts
- [ ] Documentacao clara de como usar

## Skills Praticadas

Docker, Docker Compose, Dockerfile, volumes, networks

## Entregavel — GitHub Pages

GitHub Pages com diagrama interativo dos containers — clique em cada servico para ver portas, volumes e configuracoes.

Use o arquivo `PROMPT.md` para gerar sua pagina de portfolio para este projeto.

## Recursos

Acesse o [Roadmap Interativo](https://gc-data-academy.github.io/roadmap-data-engineering) e clique neste projeto para ver a lista completa de docs e videos recomendados.

## Estrutura

```
06-docker-stack/
├── README.md        ← Voce esta aqui
├── PROMPT.md        ← Prompt para gerar o portfolio
├── solucao/         ← Codigo de referencia
└── dados/           ← Dados de exemplo
```

---

Feito com ☕ por [GC Data Academy](https://gc-data-academy.github.io/roadmap-data-engineering)
