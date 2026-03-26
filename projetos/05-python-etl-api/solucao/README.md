# Solução — Projeto 05: Python ETL de API

Passo a passo completo. Quer tentar sozinho? Volte pro [README do projeto](../README.md).

---

## Passo 1 — Preparar ambiente

```bash
mkdir python-etl-pokeapi && cd python-etl-pokeapi
python -m venv venv
source venv/bin/activate
pip install requests pandas
pip freeze > requirements.txt
```

## Passo 2 — Explorar a API

Abra no browser antes de codar:
- Lista: `https://pokeapi.co/api/v2/pokemon?limit=5`
- Detalhe: `https://pokeapi.co/api/v2/pokemon/25` (Pikachu)

## Passo 3 — Rodar o script

```bash
cd solucao
python etl.py
```

Output esperado:
```
==================================================
  ETL Pipeline — PokeAPI
==================================================
[EXTRACT] Buscando 50 Pokemon...
[EXTRACT] Lista: 50 Pokemon
[EXTRACT] Buscando detalhes de 50 Pokemon...
[EXTRACT] 10/50 concluidos
...
[TRANSFORM] 50 linhas, 17 colunas
[LOAD] CSV: ../dados/pokemon_stats.csv (50 registros)
[LOAD] SQLite: ../dados/pokemon.db
==================================================
  Concluido em 22.3s
  50 Pokemon processados
==================================================
```

## Passo 4 — Verificar dados

```bash
head -5 ../dados/pokemon_stats.csv
python -c "import sqlite3; c=sqlite3.connect('../dados/pokemon.db'); print(c.execute('SELECT * FROM stats_por_tipo').fetchall())"
```

## Passo 5 — Gerar GitHub Pages

Siga o [PROMPT.md](../PROMPT.md).

## Passo 6 — Publicar

```bash
git add .
git commit -m "feat: ETL pipeline completo com PokeAPI"
git push origin main
```

## ✅ Checklist

- [ ] Ambiente virtual + requirements.txt
- [ ] Script ETL funcional
- [ ] Dados em JSON, CSV e SQLite
- [ ] Tratamento de erros
- [ ] GitHub Pages com dashboard

---

Próximo: [06 — SQL Análise Avançada](../../06-sql-analise-avancada/)
