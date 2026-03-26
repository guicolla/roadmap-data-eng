# Solução — Projeto 06: SQL Análise Avançada

Passo a passo completo. Quer tentar sozinho? Volte pro [README do projeto](../README.md).

---

## Passo 1 — Criar o banco expandido

```bash
cd solucao
python3 -c "
import sqlite3
conn = sqlite3.connect('../dados/spotify_advanced.db')
with open('seed.sql','r') as f:
    conn.executescript(f.read())
conn.close()
print('Banco criado!')
"
```

## Passo 2 — Verificar as tabelas

```bash
python3 -c "
import sqlite3
conn = sqlite3.connect('../dados/spotify_advanced.db')
for t in ['artistas','albuns','musicas','playlists','usuarios','streams']:
    r = conn.execute(f'SELECT COUNT(*) FROM {t}').fetchone()[0]
    print(f'{t}: {r}')
conn.close()
"
```

Esperado: artistas 20, albuns 40, musicas 100, playlists 5, usuarios 10, streams 500.

## Passo 3 — Rodar as queries

```bash
# Cada query está em queries/
python3 -c "
import sqlite3
conn = sqlite3.connect('../dados/spotify_advanced.db')
with open('queries/01-ranking-artistas.sql') as f:
    sql = f.read()
for row in conn.execute(sql):
    print(row)
"
```

## Conceitos chave

**CTE:** query temporária nomeada — organiza SQL complexo em blocos legíveis.

**RANK():** numera linhas por ordem, empates recebem mesmo número.

**ROW_NUMBER():** numera linhas sequencialmente (sem empates).

**PARTITION BY:** aplica a Window Function por grupo (como GROUP BY mas sem colapsar).

**LAG():** acessa a linha anterior — perfeito pra comparar períodos.

**SUM() OVER (ORDER BY):** soma acumulada (running total).

## ✅ Checklist

- [ ] Banco com tabela streams (500 registros)
- [ ] 6 queries avançadas funcionando
- [ ] CTEs em 3+ queries
- [ ] Window Functions em 3+ queries
- [ ] GitHub Pages com SQL Explorer

---

Próximo: [07 — Docker Stack](../../07-docker-stack/)
