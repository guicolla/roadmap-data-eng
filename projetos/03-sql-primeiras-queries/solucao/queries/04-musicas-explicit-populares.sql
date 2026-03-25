-- Query 4: Quais músicas explícitas têm popularidade acima de 80?
-- Conceitos: WHERE, AND, JOIN, ORDER BY

SELECT 
    m.titulo AS musica,
    a.nome AS artista,
    m.popularidade,
    ROUND(m.duracao_ms / 1000.0, 0) AS duracao_seg
FROM musicas m
INNER JOIN albuns al ON m.album_id = al.id
INNER JOIN artistas a ON al.artista_id = a.id
WHERE m.explicit = 1
  AND m.popularidade > 80
ORDER BY m.popularidade DESC;
