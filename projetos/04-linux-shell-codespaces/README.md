# Projeto 04 — Linux + Shell Scripting

> Domine o terminal e automatize tarefas com Bash — tudo no browser via GitHub Codespaces.

## 🎯 Objetivo

Ao final deste projeto, você terá:
- Domínio dos comandos Linux essenciais para Data Engineering
- 3 scripts Bash funcionais que automatizam tarefas reais
- Entendimento de permissões, processos e variáveis de ambiente
- Uma GitHub Pages com guia interativo de comandos + terminal simulado

## 🚀 Como começar (zero instalação)

Este projeto usa **GitHub Codespaces** — um terminal Linux completo no browser:

1. Faça fork deste repo (ou crie o seu)
2. Clique no botão verde **"Code"** → **"Codespaces"** → **"Create codespace on main"**
3. Aguarde ~30 segundos
4. Pronto! Você tem um terminal Linux completo no browser

> GitHub Codespaces é gratuito para contas pessoais (60h/mês).

## 📋 O que você precisa fazer

### Parte 1 — Comandos Linux

Pratique cada grupo de comandos no terminal do Codespace:

**Navegação e arquivos:**
```bash
pwd, ls, cd, mkdir, touch, cp, mv, rm, find, tree
```

**Leitura de arquivos:**
```bash
cat, head, tail, less, wc, sort, uniq, diff
```

**Busca e filtragem:**
```bash
grep, sed, awk, cut, tr
```

**Permissões e processos:**
```bash
chmod, chown, ls -la, ps, top, kill, nohup, &
```

**Rede e downloads:**
```bash
curl, wget, ping
```

**Variáveis e ambiente:**
```bash
export, echo $PATH, env, source, .bashrc
```

### Parte 2 — Shell Scripts

Escreva 3 scripts Bash:

1. **`setup.sh`** — Configura um ambiente de Data Engineering
   - Atualiza pacotes
   - Instala Python, pip, git, jq, sqlite3
   - Cria estrutura de pastas (data/, scripts/, output/)
   - Configura variáveis de ambiente

2. **`backup.sh`** — Backup automático de arquivos
   - Recebe uma pasta como argumento
   - Compacta em .tar.gz com data no nome
   - Move para pasta de backups
   - Remove backups com mais de 7 dias
   - Gera log de execução

3. **`processa.sh`** — Processamento batch de CSVs
   - Lista todos os CSVs de uma pasta
   - Para cada CSV: conta linhas, extrai header, mostra preview
   - Gera um relatório consolidado
   - Tratamento de erros (pasta vazia, arquivo inválido)

### Parte 3 — GitHub Pages

Use o PROMPT.md para gerar sua página interativa com o Claude.

## ✅ Critérios de Pronto

- [ ] Consegue navegar e manipular arquivos no terminal
- [ ] Sabe usar grep, sed, awk para filtrar dados
- [ ] Entende permissões (chmod) e processos (ps, kill)
- [ ] 3 scripts Bash funcionais e documentados
- [ ] Scripts têm tratamento de erros
- [ ] Scripts têm comentários explicando cada bloco
- [ ] README documentando o projeto
- [ ] GitHub Pages com guia interativo

## 🛠 Skills Praticadas

Linux: navegação, manipulação de arquivos, permissões, processos, variáveis de ambiente
Bash: variáveis, condicionais, loops, funções, argumentos, redirecionamento, pipes
Ferramentas: grep, sed, awk, curl, tar, cron, jq

## 💡 Dicas

**Primeiro script?**
Todo script Bash começa com o shebang e precisa de permissão de execução:
```bash
#!/bin/bash
echo "Meu primeiro script!"
```
```bash
chmod +x meu_script.sh
./meu_script.sh
```

**Pipes são poderosos**
Combine comandos com `|` para criar pipelines no terminal:
```bash
# Contar quantas linhas têm a palavra "error" nos logs
cat app.log | grep "error" | wc -l

# Top 5 palavras mais frequentes num arquivo
cat texto.txt | tr ' ' '\n' | sort | uniq -c | sort -rn | head -5
```

**Variáveis em scripts**
```bash
NOME="Maria"
DATA=$(date +%Y-%m-%d)
echo "Backup de $NOME em $DATA"
```

**Condicionais**
```bash
if [ -f "arquivo.csv" ]; then
    echo "Arquivo existe!"
else
    echo "Arquivo não encontrado."
fi
```

## 📂 Estrutura

```
04-linux-shell-codespaces/
├── README.md                 ← Você está aqui
├── PROMPT.md                 ← Prompt para gerar a GitHub Pages
├── .devcontainer/
│   └── devcontainer.json     ← Config do Codespace
├── solucao/
│   ├── README.md             ← Passo a passo completo
│   ├── scripts/
│   │   ├── setup.sh          ← Script de setup de ambiente
│   │   ├── backup.sh         ← Script de backup
│   │   └── processa.sh       ← Script de processamento batch
│   └── index.html            ← Guia interativo de exemplo
└── dados/
    ├── vendas_jan.csv         ← CSVs de exemplo para o script
    ├── vendas_fev.csv
    └── vendas_mar.csv
```

## 📚 Recursos

Acesse o [Roadmap Interativo](https://guicolla.github.io/roadmap-data-eng) e clique neste projeto para ver docs e vídeos recomendados.

---

Feito com ☕ por [GC Data Academy](https://guicolla.github.io/roadmap-data-eng)
