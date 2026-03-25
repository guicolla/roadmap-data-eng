# Prompt para Portfolio — Projeto 02: Agenda de Contatos

Abra o [Claude](https://claude.ai) (gratuito) e cole o prompt abaixo.

---

## Prompt

```
Acesse o código de referência deste projeto de Agenda de Contatos em Python:
https://github.com/guicolla/roadmap-data-eng/tree/main/projetos/02-python-agenda-contatos/solucao

Com base nesse exemplo, gere um index.html interativo para meu portfolio de Data Engineering.

O HTML deve simular a agenda de contatos rodando no browser com um TERMINAL INTERATIVO REAL onde o usuário digita dados de verdade:

1. Header com título do projeto e badges (Python, JSON, CRUD, CLI)
2. Layout em duas colunas:
   - ESQUERDA: terminal simulado com tema escuro onde:
     - O usuário clica em botões de menu (Adicionar, Listar, Buscar, Remover)
     - Ao clicar em "Adicionar", aparece um campo de input onde o usuário DIGITA o nome, depois telefone, depois email (passo a passo, com Enter para confirmar cada campo)
     - Ao clicar em "Buscar", o usuário DIGITA o termo de busca e vê os resultados
     - Ao clicar em "Remover", o usuário DIGITA o nome e confirma com s/n
     - "Listar" mostra todos os contatos atuais em formato de tabela
     - Deve ter contatos pré-carregados para demo
     - Validações funcionam (nome vazio, email sem @, duplicatas, contato não encontrado)
     - Botões de menu ficam desabilitados enquanto o usuário está no meio de um input
   - DIREITA: painel de código Python com syntax highlighting que muda automaticamente para mostrar a função correspondente à operação selecionada
3. Seção "O que aprendi" com os conceitos Python praticados
4. Footer com link pro GitHub e portfolio

REQUISITOS TÉCNICOS:
- HTML único, responsivo, pronto para GitHub Pages
- Tema escuro, moderno e profissional
- Estilo personalizado (NÃO use as cores laranja/escuro da GC Data)
- Terminal FUNCIONAL com inputs reais (não simulação estática)
- Funcionar sem dependências externas (apenas Google Fonts via CDN)
```

---

## Como usar

1. Abra [claude.ai](https://claude.ai)
2. Cole o prompt acima
3. O Claude vai acessar o link e ver o código de referência
4. Personalize com detalhes do SEU projeto
5. Salve como `index.html` no seu repositório
6. Publique via GitHub Pages
