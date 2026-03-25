# Solução — Projeto 01: Git + GitHub Pages

Este é o passo a passo completo. Se você quer tentar sozinho primeiro, volte para o [README do projeto](../README.md).

---

## Passo 1 — Instalar o Git

**Windows:**
Baixe em [git-scm.com/download/win](https://git-scm.com/download/win) e siga a instalação padrão.

**Mac:**
```bash
brew install git
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install git -y
```

**Verifique a instalação:**
```bash
git --version
# Esperado: git version 2.x.x
```

## Passo 2 — Configurar o Git

```bash
git config --global user.name "Seu Nome Completo"
git config --global user.email "seu@email.com"
git config --global init.defaultBranch main
```

Verifique:
```bash
git config --list
# Deve mostrar user.name e user.email configurados
```

## Passo 3 — Criar conta no GitHub

1. Acesse [github.com](https://github.com) e clique em **Sign up**
2. Escolha um username profissional (vai aparecer na URL do seu portfolio)
3. Confirme o email

## Passo 4 — Criar o repositório

1. No GitHub, clique no **+** → **New repository**
2. Configure:
   - **Repository name:** `portfolio-data-engineering`
   - **Description:** "Meu portfolio de Data Engineering"
   - **Public** (obrigatório para GitHub Pages gratuito)
   - ✅ **Add a README file**
   - **Add .gitignore:** selecione `Python`
3. Clique em **Create repository**

## Passo 5 — Clonar o repositório

```bash
cd ~/projetos

git clone https://github.com/SEU-USUARIO/portfolio-data-engineering.git

cd portfolio-data-engineering

ls -la
# Deve mostrar: .git/  README.md  .gitignore
```

## Passo 6 — Criar o portfolio (index.html)

**Opção A — Usar o Claude (recomendado):**
1. Abra [claude.ai](https://claude.ai)
2. Siga as instruções do [PROMPT.md](../PROMPT.md)
3. Salve como `index.html` na raiz do repo

**Opção B — Usar o exemplo desta pasta:**
Copie o `index.html` desta pasta e edite com suas informações.

## Passo 7 — Primeiro commit

```bash
git status
# index.html aparece como "untracked"

git add index.html
git commit -m "feat: adiciona pagina inicial do portfolio"
git push origin main
```

## Passo 8 — Mais commits (mínimo 5 no total)

```bash
# Commit 2: Atualizar o README
git add README.md
git commit -m "docs: atualiza README com descricao do portfolio"

# Commit 3: Ajustar .gitignore
git add .gitignore
git commit -m "chore: configura gitignore para projetos de dados"

# Commit 4: Ajustar estilos
git add index.html
git commit -m "style: ajusta cores e espacamento do header"

# Commit 5: Nova seção
git add index.html
git commit -m "feat: adiciona secao de contato"

git push origin main
```

## Passo 9 — Trabalhar com branches

```bash
git checkout -b feature/melhorias-visuais

# Faça uma alteração no index.html

git add index.html
git commit -m "style: adiciona animacao de fade-in nos cards"

git checkout main
git merge feature/melhorias-visuais
git push origin main
```

## Passo 10 — Ativar GitHub Pages

1. No GitHub → **Settings** → **Pages**
2. Source: branch `main`, folder `/ (root)`
3. Clique **Save**
4. Aguarde 1-2 minutos
5. Acesse: `https://SEU-USUARIO.github.io/portfolio-data-engineering`

## ✅ Checklist Final

- [ ] `git --version` funciona
- [ ] Repositório público no GitHub
- [ ] Mínimo 5 commits no histórico
- [ ] Pelo menos 1 branch criada e mergeada
- [ ] `index.html` com portfolio pessoal
- [ ] GitHub Pages ativo e acessível
- [ ] README.md descrevendo o projeto

---

Próximo projeto: [02 — Python ETL de API](../../02-python-etl-api/)
