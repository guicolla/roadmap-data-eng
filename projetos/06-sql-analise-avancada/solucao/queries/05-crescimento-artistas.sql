-- Q5: Artistas com maior crescimento de streams (último mês vs penúltimo)
-- Conceito: CTE múltiplas + cálculo de variação percentual

WITH streams_por_mes AS (
    SELECT 
        a.id AS artista_id,
        a.nome,
        STRFTIME('%Y-%m', s.played_at) AS mes,
        COUNT(*) AS streams
    FROM streams s
    JOIN musicas m ON s.musica_id = m.id
    JOIN albuns al ON m.album_id = al.id
    JOIN artistas a ON al.artista_id = a.id
    GROUP BY a.id, a.nome, STRFTIME('%Y-%m', s.played_at)
),
com_anterior AS (
    SELECT 
        nome,
        mes,
        streams,
        LAG(streams) OVER (PARTITION BY artista_id ORDER BY mes) AS anterior
    FROM streams_por_mes
)
SELECT 
    nome,
    mes,
    streams AS streams_atual,
    anterior AS streams_anterior,
    ROUND(((streams * 1.0 / anterior) - 1) * 100, 1) AS crescimento_pct
FROM com_anterior
WHERE anterior IS NOT NULL AND anterior > 0
ORDER BY crescimento_pct DESC
LIMIT 10;
