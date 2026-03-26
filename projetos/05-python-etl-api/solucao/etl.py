"""
ETL Pipeline — PokeAPI
Extrai dados de Pokemon, transforma com pandas e salva em CSV/SQLite.

Uso: python etl.py
"""

import requests
import pandas as pd
import json
import sqlite3
import time
import os
from datetime import datetime

API_BASE = "https://pokeapi.co/api/v2"
TOTAL_POKEMON = 50
OUTPUT_DIR = "../dados"


def extract_pokemon_list(limit=TOTAL_POKEMON):
    """Extrai lista de Pokemon da API."""
    print(f"[EXTRACT] Buscando {limit} Pokemon...")
    try:
        resp = requests.get(f"{API_BASE}/pokemon", params={"limit": limit}, timeout=15)
        resp.raise_for_status()
        data = resp.json()
        print(f"[EXTRACT] Lista: {len(data['results'])} Pokemon")
        return data["results"]
    except requests.RequestException as e:
        print(f"[ERRO] {e}")
        return []


def extract_pokemon_details(pokemon_list):
    """Extrai detalhes de cada Pokemon."""
    print(f"[EXTRACT] Buscando detalhes de {len(pokemon_list)} Pokemon...")
    details = []
    for i, p in enumerate(pokemon_list):
        try:
            resp = requests.get(p["url"], timeout=10)
            resp.raise_for_status()
            details.append(resp.json())
            if (i + 1) % 10 == 0:
                print(f"[EXTRACT] {i+1}/{len(pokemon_list)} concluidos")
            time.sleep(0.3)
        except requests.RequestException as e:
            print(f"[AVISO] Falha em {p['name']}: {e}")
    print(f"[EXTRACT] Detalhes: {len(details)} Pokemon")
    return details


def save_raw(details):
    """Salva dados brutos em JSON."""
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    raw = {
        "extracted_at": datetime.now().isoformat(),
        "pokemon_count": len(details),
        "pokemon": [
            {
                "id": d["id"], "name": d["name"],
                "types": [t["type"]["name"] for t in d["types"]],
                "stats": {s["stat"]["name"]: s["base_stat"] for s in d["stats"]},
                "height": d["height"], "weight": d["weight"],
                "base_experience": d.get("base_experience"),
                "sprite": d["sprites"]["front_default"]
            }
            for d in details
        ]
    }
    path = os.path.join(OUTPUT_DIR, "pokemon_raw.json")
    with open(path, "w", encoding="utf-8") as f:
        json.dump(raw, f, ensure_ascii=False, indent=2)
    print(f"[RAW] Salvo em {path}")


def transform(details):
    """Transforma dados brutos em DataFrame limpo."""
    print("[TRANSFORM] Transformando dados...")
    records = []
    for d in details:
        stats = {s["stat"]["name"]: s["base_stat"] for s in d["stats"]}
        types = [t["type"]["name"] for t in d["types"]]
        records.append({
            "id": d["id"],
            "nome": d["name"].capitalize(),
            "tipo_primario": types[0] if types else None,
            "tipo_secundario": types[1] if len(types) > 1 else None,
            "hp": stats.get("hp", 0),
            "ataque": stats.get("attack", 0),
            "defesa": stats.get("defense", 0),
            "ataque_especial": stats.get("special-attack", 0),
            "defesa_especial": stats.get("special-defense", 0),
            "velocidade": stats.get("speed", 0),
            "altura_dm": d["height"],
            "peso_hg": d["weight"],
            "experiencia_base": d.get("base_experience"),
            "sprite_url": d["sprites"]["front_default"]
        })

    df = pd.DataFrame(records)

    # Conversoes
    df["altura_m"] = df["altura_dm"] / 10
    df["peso_kg"] = df["peso_hg"] / 10

    # Total stats
    stat_cols = ["hp", "ataque", "defesa", "ataque_especial", "defesa_especial", "velocidade"]
    df["total_stats"] = df[stat_cols].sum(axis=1)

    # Categoria
    df["categoria"] = pd.cut(
        df["total_stats"],
        bins=[0, 300, 400, 500, 600, 999],
        labels=["Fraco", "Mediano", "Forte", "Muito Forte", "Lendario"]
    )

    # Ranking
    df["ranking"] = df["total_stats"].rank(ascending=False, method="min").astype(int)

    # Limpar
    df = df.drop(columns=["altura_dm", "peso_hg"])
    df["experiencia_base"] = df["experiencia_base"].fillna(0).astype(int)
    df["tipo_secundario"] = df["tipo_secundario"].fillna("Nenhum")
    df = df.sort_values("id").reset_index(drop=True)

    print(f"[TRANSFORM] {df.shape[0]} linhas, {df.shape[1]} colunas")
    return df


def load_csv(df):
    """Salva em CSV."""
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    path = os.path.join(OUTPUT_DIR, "pokemon_stats.csv")
    df.to_csv(path, index=False, encoding="utf-8")
    print(f"[LOAD] CSV: {path} ({df.shape[0]} registros)")


def load_sqlite(df):
    """Salva em SQLite."""
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    path = os.path.join(OUTPUT_DIR, "pokemon.db")
    conn = sqlite3.connect(path)
    df.to_sql("pokemon", conn, if_exists="replace", index=False)
    conn.execute("""
        CREATE VIEW IF NOT EXISTS stats_por_tipo AS
        SELECT tipo_primario, COUNT(*) as qtd,
               ROUND(AVG(total_stats),1) as media_stats
        FROM pokemon GROUP BY tipo_primario
        ORDER BY media_stats DESC
    """)
    conn.commit()
    conn.close()
    print(f"[LOAD] SQLite: {path}")


def main():
    print("=" * 50)
    print("  ETL Pipeline — PokeAPI")
    print("=" * 50)
    start = time.time()

    pokemon_list = extract_pokemon_list()
    if not pokemon_list:
        return

    details = extract_pokemon_details(pokemon_list)
    save_raw(details)
    df = transform(details)
    load_csv(df)
    load_sqlite(df)

    print("=" * 50)
    print(f"  Concluido em {time.time()-start:.1f}s")
    print(f"  {df.shape[0]} Pokemon processados")
    print("=" * 50)


if __name__ == "__main__":
    main()
