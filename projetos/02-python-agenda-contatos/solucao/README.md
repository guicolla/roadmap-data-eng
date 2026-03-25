# Solução — Projeto 02: Agenda de Contatos

Este é o passo a passo completo. Se você quer tentar sozinho primeiro, volte para o [README do projeto](../README.md).

---

## Passo 1 — Instalar Python

**Windows:**
Baixe em [python.org/downloads](https://python.org/downloads). Na instalação, marque **"Add Python to PATH"**.

**Mac:**
```bash
brew install python
```

**Linux:**
```bash
sudo apt update
sudo apt install python3 python3-pip -y
```

Verifique:
```bash
python3 --version
# Esperado: Python 3.10+ 
```

## Passo 2 — Criar o repositório

```bash
mkdir python-agenda-contatos
cd python-agenda-contatos
git init
```

## Passo 3 — Entender a estrutura do programa

O `agenda.py` é organizado assim:

```
carregar_contatos()   → Lê o JSON do disco
salvar_contatos()     → Grava no JSON
adicionar_contato()   → Pede dados e adiciona à lista
listar_contatos()     → Mostra todos formatados
buscar_contato()      → Busca por nome (parcial)
editar_contato()      → Altera dados existentes
remover_contato()     → Remove com confirmação
exibir_menu()         → Mostra as opções
main()                → Loop principal (while True)
```

## Passo 4 — Começar pelo mais simples

Se você está aprendendo, não tente fazer tudo de uma vez. Comece assim:

**Versão 1:** Só o menu + adicionar + listar (sem salvar em arquivo)
```python
contatos = []

def adicionar(contatos):
    nome = input("Nome: ")
    contatos.append({"nome": nome})
    print(f"Adicionado: {nome}")

def listar(contatos):
    for c in contatos:
        print(c["nome"])

while True:
    print("\n1. Adicionar\n2. Listar\n0. Sair")
    op = input("Opção: ")
    if op == "1": adicionar(contatos)
    elif op == "2": listar(contatos)
    elif op == "0": break
```

**Versão 2:** Adiciona telefone e email

**Versão 3:** Adiciona buscar e remover

**Versão 4:** Adiciona salvar/carregar JSON

**Versão 5:** Adiciona validações e formatação bonita

## Passo 5 — Rodar o programa

```bash
python3 agenda.py
```

Output esperado:
```
🚀 Agenda iniciada! 0 contato(s) carregado(s).

╔══════════════════════════════╗
║     📒 AGENDA DE CONTATOS    ║
╠══════════════════════════════╣
║  1. Adicionar contato        ║
║  2. Listar contatos          ║
║  3. Buscar contato           ║
║  4. Editar contato           ║
║  5. Remover contato          ║
║  0. Sair                     ║
╚══════════════════════════════╝

Escolha uma opção: 1

--- Adicionar Contato ---
Nome: Maria Silva
Telefone: 11999999999
Email: maria@email.com
✅ Contato 'Maria Silva' adicionado com sucesso!
```

## Passo 6 — Gerar a GitHub Pages

Siga o [PROMPT.md](../PROMPT.md) para gerar a demo interativa com o Claude.

## Passo 7 — Commitar e publicar

```bash
git add .
git commit -m "feat: agenda de contatos completa com CRUD e persistencia JSON"
git remote add origin https://github.com/SEU-USUARIO/python-agenda-contatos.git
git push -u origin main
# Ativar GitHub Pages em Settings → Pages
```

## ✅ Checklist Final

- [ ] Python instalado e funcionando
- [ ] Script roda sem erros
- [ ] Menu interativo com 5 operações
- [ ] Dados persistem em JSON entre execuções
- [ ] Validações implementadas
- [ ] Código organizado em funções
- [ ] README no repositório
- [ ] GitHub Pages com demo interativa

---

Próximo projeto: [03 — SQL Primeiras Queries](../../03-sql-primeiras-queries/)
