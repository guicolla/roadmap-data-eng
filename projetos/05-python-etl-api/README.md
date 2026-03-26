# Projeto 05 — Python: ETL de API Pública

> Construa um pipeline ETL completo: extraia dados de uma API, transforme com pandas e carregue em CSV/SQLite.

## 🎯 Objetivo

Ao final deste projeto, você terá:
- Um script Python que extrai dados de uma API REST
- Transformações com pandas (limpeza, conversão, categorização)
- Dados persistidos em CSV e SQLite
- Tratamento de erros robusto
- Uma GitHub Pages com dashboard interativo dos dados extraídos

## 📋 O que você precisa fazer

1. Criar um ambiente virtual Python
2. Escolher uma API pública gratuita (sugestão: [PokeAPI](https://pokeapi.co/))
3. Criar um script `etl.py` com funções separadas:
   - `extract()` — chama a API e retorna dados brutos
   - `transform()` — limpa e transforma com pandas
   - `load()` — salva em CSV e SQLite
   - `main()` — orquestra tudo
4. Implementar pelo menos 3 transformações com pandas:
   - Renomear colunas
   - Converter unidades ou tipos
   - Criar colunas calculadas (rankings, categorias)
5. Tratar erros (API fora do ar, timeout, dados faltantes)
6. Salvar dados brutos em JSON e transformados em CSV + SQLite
7. Usar o PROMPT.md para gerar sua GitHub Pages no Claude
8. Documentar o pipeline no README do seu repo

## ✅ Critérios de Pronto

- [ ] Script Python roda de ponta a ponta sem erros
- [ ] Extrai dados de pelo menos 2 endpoints
- [ ] Pelo menos 3 transformações com pandas
- [ ] Dados salvos em JSON (bruto), CSV e SQLite (transformado)
- [ ] Tratamento de erros com try/except
- [ ] Rate limiting entre requests (time.sleep)
- [ ] `requirements.txt` com dependências
- [ ] README documentando o pipeline
- [ ] GitHub Pages com dashboard interativo

## 🛠 Skills Praticadas

Python: requests, pandas, json, sqlite3, time, os
Conceitos: ETL, APIs REST, JSON parsing, DataFrames, persistência de dados

## 🌐 Entregável — GitHub Pages

Dashboard interativo mostrando: fluxo do pipeline (API → Extract → Transform → Load), métricas dos dados, tabela filtrável/ordenável e código com syntax highlight.

**Abra o [PROMPT.md](PROMPT.md) e siga as instruções para gerar sua página com o Claude (gratuito em claude.ai).**

## 💡 Dicas

**Ambiente virtual**
```bash
python -m venv venv
source venv/bin/activate   # Linux/Mac
pip install requests pandas
pip freeze > requirements.txt
```

**Estrutura ETL**
Separe responsabilidades — cada função faz UMA coisa:
```python
def extract():    # Só chama a API
def transform():  # Só transforma dados
def load():       # Só salva
def main():       # Só orquestra
```

**Rate limiting**
APIs públicas bloqueiam quem faz muitas requests. Adicione delay:
```python
import time
time.sleep(0.3)  # 300ms entre cada request
```

**Requests com proteção**
```python
try:
    response = requests.get(url, timeout=10)
    response.raise_for_status()
except requests.RequestException as e:
    print(f"Erro: {e}")
```

## 📂 Estrutura

```
05-python-etl-api/
├── README.md              ← Você está aqui
├── PROMPT.md              ← Prompt para gerar a GitHub Pages
├── solucao/
│   ├── README.md          ← Passo a passo completo
│   ├── etl.py             ← Script ETL completo
│   ├── requirements.txt   ← Dependências
│   └── index.html         ← Dashboard de exemplo
└── dados/
    ├── pokemon_raw.json   ← Dados brutos
    └── pokemon_stats.csv  ← Dados transformados
```

## 📚 Recursos

Acesse o [Roadmap Interativo](https://guicolla.github.io/roadmap-data-eng) e clique neste projeto para ver docs e vídeos recomendados.

---

Feito com ☕ por [GC Data Academy](https://guicolla.github.io/roadmap-data-eng)
