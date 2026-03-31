-- fct_streams_diarios.sql — Fato: streams por artista por dia
WITH streams AS (
    SELECT * FROM {{ ref('stg_streams') }}
),
artistas AS (
    SELECT * FROM {{ ref('stg_artistas') }}
)
SELECT
    s.played_date,
    s.artista_id,
    a.nome AS artista,
    a.genero,
    COUNT(*) AS total_streams,
    ROUND(AVG(s.popularidade), 1) AS media_popularidade,
    s.dia_semana
FROM streams s
JOIN artistas a ON s.artista_id = a.id
GROUP BY s.played_date, s.artista_id, a.nome, a.genero, s.dia_semana
ORDER BY s.played_date, total_streams DESC
