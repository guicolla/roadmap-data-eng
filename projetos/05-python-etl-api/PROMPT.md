# Prompt para Portfolio — Projeto 05: Python ETL de API

Abra o [Claude](https://claude.ai) (gratuito) e cole o prompt abaixo.

---

## Prompt

```
Acesse o código de referência deste projeto de ETL com Python:
https://github.com/guicolla/roadmap-data-eng/tree/main/projetos/05-python-etl-api/solucao

Com base nesse exemplo, gere um index.html interativo para meu portfolio de Data Engineering.

O HTML deve ser um dashboard que mostra os dados extraídos via ETL, com:

1. Header com título do projeto e badges (Python, pandas, requests, SQLite)
2. Diagrama visual do fluxo ETL: API → Extract → Transform → CSV/SQLite (animado se possível)
3. Cards com métricas principais dos dados (total de registros, categorias, médias)
4. Tabela interativa com os dados:
   - Filtrável por categoria/tipo (botões de filtro)
   - Ordenável por qualquer coluna (clica no header)
   - Campo de busca por nome
5. Seção de código com syntax highlighting mostrando as funções principais do script
6. Seção "O que aprendi"
7. Footer com link pro GitHub e portfolio

REQUISITOS TÉCNICOS:
- HTML único, responsivo, pronto para GitHub Pages
- Tema escuro, moderno e profissional
- Estilo personalizado (NÃO use as cores laranja/escuro da GC Data)
- Dados mockados inline no JavaScript (não precisa chamar API)
- Métricas com animação de contagem
- Funcionar sem dependências externas (apenas Google Fonts via CDN)
```

---

## Como usar

1. Abra [claude.ai](https://claude.ai)
2. Cole o prompt acima
3. O Claude vai acessar o link e ver o código de referência
4. Personalize com os SEUS dados (a API que você usou, os dados que extraiu)
5. Salve como `index.html` no seu repositório
6. Publique via GitHub Pages
