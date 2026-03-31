-- stg_musicas.sql — Músicas com tipos corretos e métricas calculadas
WITH source AS (
    SELECT * FROM {{ ref('musicas') }}
)
SELECT
    id,
    TRIM(titulo) AS titulo,
    artista_id,
    TRIM(album) AS album,
    duracao_ms,
    ROUND(duracao_ms / 60000.0, 1) AS duracao_min,
    popularidade,
    CASE WHEN explicit = 1 THEN true ELSE false END AS is_explicit,
    CASE
        WHEN popularidade >= 95 THEN 'hit'
        WHEN popularidade >= 90 THEN 'popular'
        WHEN popularidade >= 80 THEN 'conhecida'
        ELSE 'nicho'
    END AS categoria
FROM source
