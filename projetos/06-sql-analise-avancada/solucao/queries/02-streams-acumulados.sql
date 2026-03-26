-- Q2: Streams acumulados por dia
-- Conceito: SUM() OVER (ORDER BY) — running total

WITH streams_diarios AS (
    SELECT 
        DATE(played_at) AS data,
        COUNT(*) AS streams_dia
    FROM streams
    GROUP BY DATE(played_at)
)
SELECT 
    data,
    streams_dia,
    SUM(streams_dia) OVER (ORDER BY data) AS acumulado
FROM streams_diarios
ORDER BY data;
