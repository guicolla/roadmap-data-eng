# Prompt para Portfolio — Projeto 03: SQL Primeiras Queries

Abra o [Claude](https://claude.ai) (gratuito) e cole o prompt abaixo.

---

## Prompt

```
Acesse o código de referência deste projeto de SQL com dados do Spotify:
https://github.com/guicolla/roadmap-data-eng/tree/main/projetos/03-sql-primeiras-queries/solucao

Com base nesse exemplo, gere um index.html interativo para meu portfolio de Data Engineering.

O HTML deve ser um SQL Explorer interativo com:

1. Header com título "SQL Análise — Spotify Data" e badges (SQL, SQLite, JOINs, GROUP BY)
2. Layout com sidebar + área principal:
   - SIDEBAR: lista das 6 queries clicáveis, cada uma com o título da pergunta que responde
   - ÁREA PRINCIPAL dividida em:
     - TOPO: código SQL da query selecionada com syntax highlighting
     - MEIO: botão "Executar Query" que simula a execução
     - BAIXO: tabela de resultados mockados com dados realistas
3. Seção com o diagrama do schema (as 5 tabelas e seus relacionamentos)
4. Seção "Sobre o Projeto" e "O que aprendi"
5. Footer com links

A sidebar deve mostrar contadores das tabelas (artistas: 20, álbuns: 40, músicas: 100, etc).

REQUISITOS TÉCNICOS:
- HTML único, responsivo, pronto para GitHub Pages
- Tema escuro, moderno e profissional
- Estilo personalizado (NÃO use as cores laranja/escuro da GC Data)
- SQL syntax highlighting (keywords em cor diferente)
- Tabela de resultados com hover e formatação
- Funcionar sem dependências externas (apenas Google Fonts via CDN)
```

---

## Como usar

1. Abra [claude.ai](https://claude.ai)
2. Cole o prompt acima
3. O Claude vai acessar o link e ver o código de referência
4. Personalize com os SEUS dados e queries
5. Salve como `index.html` no seu repositório
6. Publique via GitHub Pages
