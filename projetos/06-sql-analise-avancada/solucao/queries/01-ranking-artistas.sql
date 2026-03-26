-- Q1: Ranking de artistas por total de streams
-- Conceito: RANK() Window Function

WITH streams_artista AS (
    SELECT 
        a.nome,
        a.genero,
        COUNT(s.id) AS total_streams
    FROM streams s
    JOIN musicas m ON s.musica_id = m.id
    JOIN albuns al ON m.album_id = al.id
    JOIN artistas a ON al.artista_id = a.id
    GROUP BY a.id, a.nome, a.genero
)
SELECT 
    nome,
    genero,
    total_streams,
    RANK() OVER (ORDER BY total_streams DESC) AS ranking
FROM streams_artista
ORDER BY ranking
LIMIT 10;
