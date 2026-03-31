-- stg_artistas.sql — Artistas limpos e padronizados
WITH source AS (
    SELECT * FROM {{ ref('artistas') }}
)
SELECT
    id,
    LOWER(TRIM(nome)) AS nome,
    LOWER(TRIM(genero)) AS genero,
    LOWER(TRIM(pais)) AS pais,
    seguidores,
    CASE
        WHEN seguidores >= 70000000 THEN 'mega'
        WHEN seguidores >= 40000000 THEN 'grande'
        ELSE 'medio'
    END AS tier
FROM source
WHERE nome IS NOT NULL
