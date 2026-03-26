"""
spotify_pipeline.py — DAG do Airflow
Pipeline: check_file → extract → transform → load

Coloque este arquivo em: dags/spotify_pipeline.py
"""

import json
import csv
import os
from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator


# === CONFIGURAÇÃO ===
DATA_DIR = "/opt/airflow/data"
INPUT_FILE = os.path.join(DATA_DIR, "spotify_top10.csv")
OUTPUT_FILE = os.path.join(DATA_DIR, "spotify_transformed.json")

default_args = {
    "owner": "data-eng",
    "retries": 2,
    "retry_delay": timedelta(minutes=5),
    "email_on_failure": False,
}


# === FUNÇÕES DAS TASKS ===

def extract_data(**kwargs):
    """Lê o CSV e retorna os dados via XCom."""
    print(f"[EXTRACT] Lendo {INPUT_FILE}...")

    if not os.path.exists(INPUT_FILE):
        raise FileNotFoundError(f"Arquivo não encontrado: {INPUT_FILE}")

    with open(INPUT_FILE, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        data = list(reader)

    print(f"[EXTRACT] {len(data)} registros lidos")

    # Retornar via XCom (push automático)
    return data


def transform_data(**kwargs):
    """Recebe dados via XCom, limpa e transforma."""
    ti = kwargs["ti"]
    data = ti.xcom_pull(task_ids="extract")

    if not data:
        raise ValueError("Nenhum dado recebido do extract")

    print(f"[TRANSFORM] Processando {len(data)} registros...")

    transformed = []
    for row in data:
        transformed.append({
            "artista": row["artista"].strip().title(),
            "musica": row["musica"].strip(),
            "streams_milhoes": round(int(row["streams"]) / 1_000_000, 1),
            "duracao_min": round(int(row["duracao_ms"]) / 60_000, 1),
            "popularidade": int(row["popularidade"]),
            "categoria": (
                "Hit" if int(row["popularidade"]) >= 90
                else "Popular" if int(row["popularidade"]) >= 80
                else "Regular"
            ),
            "processado_em": datetime.now().isoformat(),
        })

    # Ordenar por popularidade
    transformed.sort(key=lambda x: x["popularidade"], reverse=True)

    print(f"[TRANSFORM] {len(transformed)} registros transformados")
    print(f"[TRANSFORM] Categorias: {len([t for t in transformed if t['categoria']=='Hit'])} hits, "
          f"{len([t for t in transformed if t['categoria']=='Popular'])} populares")

    return transformed


def load_data(**kwargs):
    """Recebe dados transformados e salva em JSON."""
    ti = kwargs["ti"]
    data = ti.xcom_pull(task_ids="transform")

    if not data:
        raise ValueError("Nenhum dado recebido do transform")

    print(f"[LOAD] Salvando {len(data)} registros em {OUTPUT_FILE}...")

    output = {
        "pipeline": "spotify_pipeline",
        "executed_at": datetime.now().isoformat(),
        "total_records": len(data),
        "data": data,
    }

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(output, f, ensure_ascii=False, indent=2)

    print(f"[LOAD] Arquivo salvo: {OUTPUT_FILE}")
    print(f"[LOAD] Pipeline concluído com sucesso!")

    return f"{len(data)} registros salvos"


# === DAG ===

with DAG(
    dag_id="spotify_pipeline",
    description="Pipeline ETL: CSV → Transform → JSON",
    start_date=datetime(2024, 1, 1),
    schedule="@daily",
    default_args=default_args,
    catchup=False,
    tags=["spotify", "etl", "portfolio"],
) as dag:

    # Task 1: Verificar se o arquivo existe
    check_file = BashOperator(
        task_id="check_file",
        bash_command=f"test -f {INPUT_FILE} && echo 'Arquivo encontrado' || exit 1",
    )

    # Task 2: Extrair dados do CSV
    extract = PythonOperator(
        task_id="extract",
        python_callable=extract_data,
    )

    # Task 3: Transformar dados
    transform = PythonOperator(
        task_id="transform",
        python_callable=transform_data,
    )

    # Task 4: Carregar resultado
    load = PythonOperator(
        task_id="load",
        python_callable=load_data,
    )

    # Dependências
    check_file >> extract >> transform >> load
