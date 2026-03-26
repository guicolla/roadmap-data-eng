# Prompt para Portfolio — Projeto 04: Linux + Shell Scripting

Abra o [Claude](https://claude.ai) (gratuito) e cole o prompt abaixo.

---

## Prompt

```
Acesse o código de referência deste projeto de Linux e Shell Scripting:
https://github.com/guicolla/roadmap-data-eng/tree/main/projetos/04-linux-shell-codespaces/solucao

Com base nesse exemplo, gere um index.html interativo para meu portfolio de Data Engineering.

O HTML deve ter duas seções principais:

SEÇÃO 1 — Guia de Comandos Linux:
- Grid de categorias (Navegação, Arquivos, Busca, Permissões, Processos, Rede)
- Ao clicar numa categoria, mostra os comandos daquela categoria
- Cada comando tem: nome, descrição curta, exemplo de uso e output esperado
- Visual de terminal (fonte mono, fundo escuro)

SEÇÃO 2 — Terminal Simulado com Scripts:
- 3 botões: Setup, Backup, Processamento
- Ao clicar, o "terminal" simula a execução do script com:
  - Prompt verde estilo bash (user@codespace:~$)
  - Output aparecendo linha por linha com animação de digitação
  - Cores no output (verde pra sucesso, vermelho pra erro, amarelo pra aviso)
  - O usuário pode clicar em "Executar" para ver o script rodar

REQUISITOS TÉCNICOS:
- HTML único, responsivo, pronto para GitHub Pages
- Tema escuro com visual de terminal Linux real
- Estilo personalizado (NÃO use as cores laranja/escuro da GC Data)
- Animação de digitação no terminal simulado
- Funcionar sem dependências externas (apenas Google Fonts via CDN)
```

---

## Como usar

1. Abra [claude.ai](https://claude.ai)
2. Cole o prompt acima
3. O Claude vai acessar o link e ver os scripts de referência
4. Personalize com os SEUS scripts e comandos favoritos
5. Salve como `index.html` no seu repositório
6. Publique via GitHub Pages
