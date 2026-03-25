-- Query 3: Qual a duração média das músicas por gênero?
-- Conceitos: JOIN múltiplo, AVG, GROUP BY, aritmética

SELECT 
    a.genero,
    COUNT(m.id) AS total_musicas,
    ROUND(AVG(m.duracao_ms) / 1000.0, 0) AS duracao_media_seg,
    ROUND(AVG(m.popularidade), 1) AS popularidade_media
FROM musicas m
INNER JOIN albuns al ON m.album_id = al.id
INNER JOIN artistas a ON al.artista_id = a.id
GROUP BY a.genero
ORDER BY duracao_media_seg DESC;
