-- Q4: Top 3 músicas mais ouvidas por gênero
-- Conceito: ROW_NUMBER() + PARTITION BY

WITH ranked AS (
    SELECT 
        a.genero,
        m.titulo AS musica,
        a.nome AS artista,
        COUNT(s.id) AS streams,
        ROW_NUMBER() OVER (
            PARTITION BY a.genero 
            ORDER BY COUNT(s.id) DESC
        ) AS rn
    FROM streams s
    JOIN musicas m ON s.musica_id = m.id
    JOIN albuns al ON m.album_id = al.id
    JOIN artistas a ON al.artista_id = a.id
    GROUP BY a.genero, m.id, m.titulo, a.nome
)
SELECT genero, musica, artista, streams, rn AS posicao
FROM ranked
WHERE rn <= 3
ORDER BY genero, rn;
