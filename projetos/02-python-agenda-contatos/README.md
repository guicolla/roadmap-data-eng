# Projeto 02 — Python: Agenda de Contatos

> Aprenda Python básico construindo uma agenda de contatos funcional no terminal.

## 🎯 Objetivo

Ao final deste projeto, você terá:
- Seu primeiro programa Python funcional
- Entendimento de variáveis, dicionários, listas e funções
- Um CRUD completo (Create, Read, Update, Delete)
- Dados persistidos em arquivo JSON
- Uma GitHub Pages interativa simulando a agenda no browser

## 📋 O que você precisa fazer

1. Instalar Python no seu computador (3.10+)
2. Criar um script `agenda.py` com menu interativo no terminal
3. Implementar as operações:
   - **Adicionar** contato (nome, telefone, email)
   - **Listar** todos os contatos
   - **Buscar** contato por nome
   - **Editar** contato existente
   - **Remover** contato
4. Salvar os contatos em arquivo JSON (persistência)
5. Carregar contatos do JSON ao iniciar o programa
6. Tratar entradas inválidas (nome vazio, email sem @, etc.)
7. Usar o PROMPT.md para gerar sua GitHub Pages no Claude
8. Documentar tudo no README do seu repo

## ✅ Critérios de Pronto

- [ ] Script Python roda sem erros
- [ ] Menu interativo funcionando no terminal
- [ ] 5 operações implementadas (adicionar, listar, buscar, editar, remover)
- [ ] Dados salvos em JSON (persistem entre execuções)
- [ ] Validação de entrada (não aceita dados vazios/inválidos)
- [ ] Código organizado em funções
- [ ] README documentando o projeto
- [ ] GitHub Pages com simulação interativa da agenda

## 🛠 Skills Praticadas

Python básico: variáveis, strings, números, listas, dicionários, funções, loops (while/for), condicionais (if/elif/else), input/output, leitura/escrita de arquivos, JSON

## 🌐 Entregável — GitHub Pages

Simulação interativa da agenda rodando no browser — um terminal fake onde o visitante pode adicionar, buscar, listar e remover contatos, mostrando o código Python ao lado.

**Abra o [PROMPT.md](PROMPT.md) e siga as instruções para gerar sua página com o Claude (gratuito em claude.ai).**

## 💡 Dicas

**Nunca programou em Python?**
Comece pelo básico no terminal:
```python
# Abra o terminal e digite: python3
>>> nome = "Maria"
>>> print(f"Olá, {nome}!")
Olá, Maria!
>>> contato = {"nome": "Maria", "tel": "11999999999"}
>>> print(contato["nome"])
Maria
```

**Estrutura sugerida do código**
Organize em funções — cada operação é uma função:
```python
def adicionar_contato(contatos):
    ...

def listar_contatos(contatos):
    ...

def buscar_contato(contatos, nome):
    ...

def menu():
    # Loop principal com while True
    ...
```

**Salvando em JSON**
```python
import json

# Salvar
with open("contatos.json", "w") as f:
    json.dump(contatos, f, indent=2, ensure_ascii=False)

# Carregar
with open("contatos.json", "r") as f:
    contatos = json.load(f)
```

**Validação simples**
```python
nome = input("Nome: ").strip()
if not nome:
    print("Erro: nome não pode ser vazio!")
    return
```

## 📂 Estrutura

```
02-python-agenda-contatos/
├── README.md        ← Você está aqui
├── PROMPT.md        ← Prompt para gerar a GitHub Pages
├── solucao/
│   ├── README.md    ← Passo a passo completo
│   ├── agenda.py    ← Código completo da agenda
│   └── index.html   ← Demo interativa de exemplo
└── dados/
    └── contatos.json ← Dados de exemplo
```

## 📚 Recursos

Acesse o [Roadmap Interativo](https://guicolla.github.io/roadmap-data-eng) e clique neste projeto para ver docs e vídeos recomendados.

---

Feito com ☕ por [GC Data Academy](https://guicolla.github.io/roadmap-data-eng)
