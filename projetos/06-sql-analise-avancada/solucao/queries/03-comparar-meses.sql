-- Q3: Comparar streams mês atual vs anterior por artista
-- Conceito: LAG() Window Function

WITH streams_mensais AS (
    SELECT 
        a.nome AS artista,
        STRFTIME('%Y-%m', s.played_at) AS mes,
        COUNT(*) AS streams
    FROM streams s
    JOIN musicas m ON s.musica_id = m.id
    JOIN albuns al ON m.album_id = al.id
    JOIN artistas a ON al.artista_id = a.id
    GROUP BY a.id, a.nome, STRFTIME('%Y-%m', s.played_at)
)
SELECT 
    artista,
    mes,
    streams,
    LAG(streams) OVER (PARTITION BY artista ORDER BY mes) AS mes_anterior,
    streams - COALESCE(LAG(streams) OVER (PARTITION BY artista ORDER BY mes), 0) AS variacao
FROM streams_mensais
ORDER BY artista, mes;
