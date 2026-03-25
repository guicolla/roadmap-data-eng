-- Query 5: Qual artista tem a música mais popular?
-- Conceitos: JOIN, MAX, ORDER BY, LIMIT

SELECT 
    a.nome AS artista,
    m.titulo AS musica,
    al.titulo AS album,
    m.popularidade,
    al.ano_lancamento
FROM musicas m
INNER JOIN albuns al ON m.album_id = al.id
INNER JOIN artistas a ON al.artista_id = a.id
ORDER BY m.popularidade DESC
LIMIT 10;
