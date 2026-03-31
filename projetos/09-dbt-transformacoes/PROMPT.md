# Prompt para Portfolio — Projeto 09: dbt Transformações

Abra o [Claude](https://claude.ai) (gratuito) e cole o prompt abaixo.

---

## Prompt

```
Acesse o código de referência deste projeto dbt:
https://github.com/guicolla/roadmap-data-eng/tree/main/projetos/09-dbt-transformacoes/solucao

Com base nesse exemplo, gere um index.html interativo para meu portfolio de Data Engineering.

O HTML deve mostrar o projeto dbt como um lineage graph interativo:

1. Header com título e badges (dbt, SQL, PostgreSQL, Testes, Docs)
2. Lineage graph visual:
   - Nodes para cada model: seeds (amarelo), staging (azul), marts (verde)
   - Setas de dependência (ref()) entre os nodes
   - Ao clicar num node: mostra código SQL, descrição, testes configurados e materialização
3. Painel lateral com:
   - Lista de models clicáveis
   - Contadores: total models, testes, seeds
   - Status dos testes (todos passando)
4. Seção mostrando o schema.yml com os testes configurados
5. Seção "Conceitos dbt" com cards: Seeds, Staging, Marts, ref(), Tests, Docs
6. Footer

REQUISITOS TÉCNICOS:
- HTML único, responsivo, pronto para GitHub Pages
- Tema escuro, moderno
- Lineage graph com SVG ou CSS (não imagem estática)
- Nodes clicáveis com painel de detalhes
- Funcionar sem dependências externas (apenas Google Fonts via CDN)
```

---

## Como usar

1. Abra [claude.ai](https://claude.ai)
2. Cole o prompt acima
3. Personalize com os SEUS models
4. Salve como `index.html`, publique via GitHub Pages
