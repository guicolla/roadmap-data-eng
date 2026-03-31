-- Testa que todos os streams têm contagem positiva
SELECT played_date, artista_id, total_streams
FROM {{ ref('fct_streams_diarios') }}
WHERE total_streams <= 0
