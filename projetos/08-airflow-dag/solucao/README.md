# Solução — Projeto 08: Airflow DAG

Passo a passo. Quer tentar sozinho? Volte pro [README do projeto](../README.md).

---

## Passo 1 — Subir Airflow

```bash
cd solucao
docker-compose up -d
```

Aguarde ~1 minuto. O init cria o banco e o usuário admin.

```bash
docker-compose ps
# Deve mostrar: airflow-postgres, airflow-webserver, airflow-scheduler rodando
```

## Passo 2 — Acessar a UI

Abra: **http://localhost:8080**
- User: `airflow`
- Password: `airflow`

A DAG `spotify_pipeline` deve aparecer na lista.

## Passo 3 — Executar a DAG

1. Na UI, clique na DAG `spotify_pipeline`
2. Clique no botão ▶ (Trigger DAG)
3. Acompanhe a execução no Graph View
4. Todas as tasks devem ficar verdes (sucesso)

## Passo 4 — Verificar resultado

```bash
# Ver o JSON gerado
cat data/spotify_transformed.json | python3 -m json.tool | head -20

# Ver logs de uma task
docker-compose logs scheduler | grep "TRANSFORM"
```

## Passo 5 — Entender a DAG

```
check_file ──→ extract ──→ transform ──→ load
(Bash)         (Python)     (Python)      (Python)
                  │              │
                  └── XCom ──────┘
                  (passa dados entre tasks)
```

## Passo 6 — Derrubar

```bash
docker-compose down -v
```

## ✅ Checklist

- [ ] Airflow rodando em Docker
- [ ] DAG visível na UI (localhost:8080)
- [ ] 4 tasks executam com sucesso
- [ ] XCom funcionando (extract → transform)
- [ ] JSON de saída gerado
- [ ] GitHub Pages com visualização da DAG

---

Próximo: [09 — dbt Transformações](../../09-dbt-transformacoes/)
