# Projeto 01 — Git + GitHub Pages

> Configure seu portfolio de Data Engineer e publique sua primeira GitHub Pages.

## 🎯 Objetivo

Ao final deste projeto, você terá:
- Git instalado e configurado no seu computador
- Um repositório no GitHub com histórico de commits
- Uma página de portfolio publicada e acessível via GitHub Pages
- Entendimento dos comandos fundamentais do Git

## 📋 O que você precisa fazer

1. Instalar o Git no seu computador
2. Criar uma conta no GitHub (se ainda não tem)
3. Criar um repositório público para seu portfolio
4. Clonar o repositório na sua máquina
5. Criar um arquivo `index.html` com seu portfolio pessoal
6. Fazer pelo menos 5 commits com mensagens descritivas
7. Criar uma branch, fazer uma alteração e mergear na main
8. Ativar GitHub Pages nas configurações do repositório
9. Confirmar que o site está acessível em `https://seu-usuario.github.io/seu-repo`

## ✅ Critérios de Pronto

- [ ] Repositório público no GitHub
- [ ] Mínimo 5 commits com mensagens claras
- [ ] Pelo menos 1 branch criada e mergeada
- [ ] GitHub Pages ativo e acessível
- [ ] `index.html` com portfolio funcional e responsivo
- [ ] `README.md` descrevendo o projeto
- [ ] `.gitignore` configurado

## 🛠 Skills Praticadas

Git (clone, add, commit, push, branch, merge), GitHub, GitHub Pages, HTML/CSS básico, uso de IA para geração de código

## 🌐 Entregável — GitHub Pages

Seu portfolio online com página inicial contendo: seção sobre você, suas skills, cards para os projetos futuros (que você vai preencher ao longo do roadmap) e informações de contato.

Use o arquivo `PROMPT.md` para gerar sua página com o Claude (gratuito em claude.ai).

## 💡 Dicas

**Nunca usou Git?**
Não se preocupe. Comece instalando o Git e configurando seu nome e email:
```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```
Depois siga a ordem dos passos acima. Se travar em algum, olhe a pasta `solucao/` — lá tem um passo a passo completo.

**Não sabe HTML?**
Tudo bem! O `PROMPT.md` tem um prompt pronto para o Claude gerar o HTML do seu portfolio. Você só precisa personalizar com suas informações.

**Mensagens de commit**
Evite mensagens genéricas como "update" ou "fix". Prefira algo descritivo:
- ✅ `feat: adiciona seção de skills no portfolio`
- ✅ `style: ajusta cores e espaçamento do header`
- ❌ `update`
- ❌ `asdasd`

**Branch**
Crie uma branch para adicionar uma feature nova (ex: seção de contato):
```bash
git checkout -b feature/secao-contato
# faz as alterações
git add .
git commit -m "feat: adiciona seção de contato"
git checkout main
git merge feature/secao-contato
```

## 📂 Estrutura

```
01-git-github-pages/
├── README.md        ← Você está aqui
├── PROMPT.md        ← Prompt para gerar o portfolio com IA
├── solucao/
│   ├── README.md    ← Passo a passo completo (tutorial)
│   ├── index.html   ← Portfolio de exemplo
│   └── .gitignore   ← Template para projetos de dados
└── dados/
```

## 📚 Recursos

Acesse o [Roadmap Interativo](https://gc-data-academy.github.io/roadmap-data-engineering) e clique neste projeto para ver docs e vídeos recomendados.

---

Feito com ☕ por [GC Data Academy](https://gc-data-academy.github.io/roadmap-data-engineering)
