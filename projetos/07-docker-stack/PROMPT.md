# Prompt para Portfolio — Projeto 07: Docker Stack

Abra o [Claude](https://claude.ai) (gratuito) e cole o prompt abaixo.

---

## Prompt

```
Acesse o código de referência deste projeto Docker:
https://github.com/guicolla/roadmap-data-eng/tree/main/projetos/07-docker-stack/solucao

Com base nesse exemplo, gere um index.html interativo para meu portfolio de Data Engineering.

O HTML deve mostrar a arquitetura Docker com:

1. Header com título e badges (Docker, Compose, PostgreSQL, pgAdmin)
2. Diagrama interativo da arquitetura:
   - 3 containers visuais (PostgreSQL, pgAdmin, ETL) com ícones
   - Setas mostrando comunicação entre eles
   - Ao clicar em cada container, abre um painel com: imagem usada, portas, volumes, variáveis de ambiente, dependências
   - Volume externo visível (pgdata)
   - Network conectando os 3
3. Seção de código mostrando o docker-compose.yml com syntax highlight
4. Seção mostrando o Dockerfile com explicação de cada linha
5. Terminal simulado com os comandos docker-compose (up, ps, logs, down)
6. Seção "O que aprendi"
7. Footer

REQUISITOS TÉCNICOS:
- HTML único, responsivo, pronto para GitHub Pages
- Tema escuro, moderno
- Diagrama SVG ou CSS dos containers (não imagem estática)
- Containers clicáveis com painel de detalhes
- Funcionar sem dependências externas (apenas Google Fonts via CDN)
```

---

## Como usar

1. Abra [claude.ai](https://claude.ai)
2. Cole o prompt acima
3. Personalize com a SUA stack Docker
4. Salve como `index.html`, publique via GitHub Pages
