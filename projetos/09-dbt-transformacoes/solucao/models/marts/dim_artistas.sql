-- dim_artistas.sql — Dimensão artistas com métricas agregadas
WITH artistas AS (
    SELECT * FROM {{ ref('stg_artistas') }}
),
streams AS (
    SELECT * FROM {{ ref('stg_streams') }}
),
musicas AS (
    SELECT * FROM {{ ref('stg_musicas') }}
),
stream_metrics AS (
    SELECT
        artista_id,
        COUNT(*) AS total_streams,
        COUNT(DISTINCT played_date) AS dias_com_streams,
        MIN(played_date) AS primeiro_stream,
        MAX(played_date) AS ultimo_stream
    FROM streams
    GROUP BY artista_id
),
musica_metrics AS (
    SELECT
        artista_id,
        COUNT(*) AS total_musicas,
        ROUND(AVG(popularidade), 1) AS media_popularidade,
        MAX(popularidade) AS max_popularidade
    FROM musicas
    GROUP BY artista_id
)
SELECT
    a.id,
    a.nome,
    a.genero,
    a.pais,
    a.seguidores,
    a.tier,
    COALESCE(sm.total_streams, 0) AS total_streams,
    COALESCE(sm.dias_com_streams, 0) AS dias_com_streams,
    sm.primeiro_stream,
    sm.ultimo_stream,
    COALESCE(mm.total_musicas, 0) AS total_musicas,
    COALESCE(mm.media_popularidade, 0) AS media_popularidade,
    COALESCE(mm.max_popularidade, 0) AS max_popularidade
FROM artistas a
LEFT JOIN stream_metrics sm ON a.id = sm.artista_id
LEFT JOIN musica_metrics mm ON a.id = mm.artista_id
