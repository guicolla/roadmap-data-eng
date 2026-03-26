"""
load.py — Carrega dados CSV no PostgreSQL
Roda dentro do container Docker ETL.
"""

import os
import csv
import time
import psycopg2
from psycopg2 import sql

DB_CONFIG = {
    "host": os.getenv("DB_HOST", "localhost"),
    "port": os.getenv("DB_PORT", "5432"),
    "user": os.getenv("DB_USER", "dataeng"),
    "password": os.getenv("DB_PASSWORD", "dataeng123"),
    "dbname": os.getenv("DB_NAME", "spotify"),
}

GREEN = "\033[92m"
RED = "\033[91m"
YELLOW = "\033[93m"
NC = "\033[0m"


def wait_for_db(max_retries=10, delay=3):
    """Aguarda o PostgreSQL ficar pronto."""
    print("Aguardando PostgreSQL...")
    for i in range(max_retries):
        try:
            conn = psycopg2.connect(**DB_CONFIG)
            conn.close()
            print(f"{GREEN}[OK]{NC} PostgreSQL pronto!")
            return True
        except psycopg2.OperationalError:
            print(f"  Tentativa {i+1}/{max_retries}...")
            time.sleep(delay)
    print(f"{RED}[ERRO]{NC} PostgreSQL nao respondeu.")
    return False


def create_tables(conn):
    """Cria as tabelas no banco."""
    print("Criando tabelas...")
    with conn.cursor() as cur:
        cur.execute("""
            CREATE TABLE IF NOT EXISTS artistas (
                id SERIAL PRIMARY KEY,
                nome VARCHAR(100) NOT NULL,
                genero VARCHAR(50),
                seguidores INTEGER DEFAULT 0
            );

            CREATE TABLE IF NOT EXISTS musicas (
                id SERIAL PRIMARY KEY,
                titulo VARCHAR(200) NOT NULL,
                artista_id INTEGER REFERENCES artistas(id),
                album VARCHAR(200),
                duracao_ms INTEGER,
                popularidade INTEGER DEFAULT 0
            );
        """)
        conn.commit()
    print(f"{GREEN}[OK]{NC} Tabelas criadas")


def load_csv(conn, filepath, table):
    """Carrega um CSV no PostgreSQL."""
    print(f"Carregando {filepath} -> {table}...")

    with open(filepath, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        rows = list(reader)

    if not rows:
        print(f"{YELLOW}[AVISO]{NC} Arquivo vazio: {filepath}")
        return 0

    columns = rows[0].keys()
    insert_sql = sql.SQL("INSERT INTO {} ({}) VALUES ({}) ON CONFLICT DO NOTHING").format(
        sql.Identifier(table),
        sql.SQL(", ").join(map(sql.Identifier, columns)),
        sql.SQL(", ").join(sql.Placeholder() * len(columns)),
    )

    with conn.cursor() as cur:
        for row in rows:
            values = []
            for col in columns:
                val = row[col]
                # Tentar converter números
                try:
                    val = int(val)
                except (ValueError, TypeError):
                    try:
                        val = float(val)
                    except (ValueError, TypeError):
                        pass
                values.append(val)
            cur.execute(insert_sql, values)
        conn.commit()

    print(f"{GREEN}[OK]{NC} {len(rows)} registros carregados em {table}")
    return len(rows)


def main():
    print("=" * 50)
    print("  ETL — Carga de dados no PostgreSQL")
    print("=" * 50)

    if not wait_for_db():
        return

    conn = psycopg2.connect(**DB_CONFIG)
    create_tables(conn)

    total = 0
    data_dir = "dados"

    # Carregar artistas
    artistas_path = os.path.join(data_dir, "artistas.csv")
    if os.path.exists(artistas_path):
        total += load_csv(conn, artistas_path, "artistas")

    # Carregar musicas
    musicas_path = os.path.join(data_dir, "musicas.csv")
    if os.path.exists(musicas_path):
        total += load_csv(conn, musicas_path, "musicas")

    # Verificar
    with conn.cursor() as cur:
        cur.execute("SELECT COUNT(*) FROM artistas")
        n_artistas = cur.fetchone()[0]
        cur.execute("SELECT COUNT(*) FROM musicas")
        n_musicas = cur.fetchone()[0]

    conn.close()

    print("")
    print("=" * 50)
    print(f"{GREEN}[OK]{NC} Carga concluida!")
    print(f"  Artistas: {n_artistas}")
    print(f"  Musicas:  {n_musicas}")
    print(f"  Total:    {total} registros")
    print("=" * 50)


if __name__ == "__main__":
    main()
