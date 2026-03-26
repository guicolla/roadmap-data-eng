# Projeto 08 — Airflow: Primeira DAG

> Orquestre um pipeline de dados com Apache Airflow rodando em Docker.

## 🎯 Objetivo

Ao final deste projeto, você terá:
- Airflow rodando localmente via Docker Compose
- Uma DAG com 4 tasks encadeadas (sensor → extract → transform → load)
- Entendimento de Operators, dependências, schedules e XCom
- Uma GitHub Pages com visualização interativa da DAG

## 📋 O que você precisa fazer

1. Subir Airflow com Docker Compose (imagem oficial)
2. Criar uma DAG `spotify_pipeline` com 4 tasks:
   - **check_file** — BashOperator que verifica se o CSV existe
   - **extract** — PythonOperator que lê o CSV
   - **transform** — PythonOperator que limpa e transforma dados
   - **load** — PythonOperator que salva resultado em JSON
3. Configurar:
   - Schedule: diário (`@daily`)
   - Retries: 2 tentativas com delay de 5 minutos
   - Dependências: check → extract → transform → load
   - XCom: passar dados entre extract → transform
4. Acessar a UI do Airflow em `localhost:8080`
5. Executar a DAG manualmente e verificar logs
6. Usar o PROMPT.md para gerar a GitHub Pages
7. Documentar no README

## ✅ Critérios de Pronto

- [ ] Airflow rodando em Docker com `docker-compose up`
- [ ] DAG aparece na UI do Airflow
- [ ] 4 tasks executam com sucesso
- [ ] Dependências corretas (linear: check → extract → transform → load)
- [ ] Schedule configurado
- [ ] Retries configurados
- [ ] XCom passando dados entre tasks
- [ ] README com instruções de uso
- [ ] GitHub Pages com visualização da DAG

## 🛠 Skills Praticadas

Airflow: DAGs, PythonOperator, BashOperator, schedule, retries, XCom, UI, logs
Docker: docker-compose com Airflow (webserver, scheduler, postgres)

## 🌐 Entregável — GitHub Pages

Visualização interativa da DAG com: grafo de tasks clicável, timeline de execução simulada, painel de detalhes de cada task (operator, código, logs) e status coloridos.

**Abra o [PROMPT.md](PROMPT.md) e siga as instruções.**

## 💡 Dicas

**Subir Airflow com Docker**
Usamos a imagem oficial com Compose. O `docker-compose.yml` da solução já vem configurado — basta:
```bash
docker-compose up -d
# Aguarde ~1 minuto
# Acesse http://localhost:8080
# Login: airflow / airflow
```

**Estrutura de uma DAG**
```python
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta

default_args = {
    'retries': 2,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    dag_id='minha_dag',
    start_date=datetime(2024, 1, 1),
    schedule='@daily',
    default_args=default_args,
    catchup=False,
) as dag:

    task1 = PythonOperator(
        task_id='extract',
        python_callable=minha_funcao,
    )
```

**XCom — passar dados entre tasks**
```python
# Na task que ENVIA (return = push automático)
def extract(**kwargs):
    data = [1, 2, 3]
    return data  # Automaticamente salva no XCom

# Na task que RECEBE
def transform(**kwargs):
    ti = kwargs['ti']
    data = ti.xcom_pull(task_ids='extract')
    print(f"Recebi: {data}")
```

**Dependências**
```python
check >> extract >> transform >> load
```

## 📂 Estrutura

```
08-airflow-dag/
├── README.md
├── PROMPT.md
├── solucao/
│   ├── README.md
│   ├── docker-compose.yml    ← Airflow em Docker
│   ├── dags/
│   │   └── spotify_pipeline.py  ← A DAG
│   ├── data/
│   │   └── spotify_top10.csv    ← Dados de entrada
│   └── index.html
└── dados/
```

## 📚 Recursos

Acesse o [Roadmap Interativo](https://guicolla.github.io/roadmap-data-eng) e clique neste projeto.

---

Feito com ☕ por [GC Data Academy](https://guicolla.github.io/roadmap-data-eng)
