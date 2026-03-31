-- stg_streams.sql — Streams com timestamps parseados
WITH source AS (
    SELECT * FROM {{ ref('streams') }}
)
SELECT
    id,
    musica_id,
    artista_id,
    played_at::timestamp AS played_at,
    DATE(played_at::timestamp) AS played_date,
    EXTRACT(MONTH FROM played_at::timestamp) AS mes,
    EXTRACT(DOW FROM played_at::timestamp) AS dia_semana,
    popularidade
FROM source
