-- Query 2: Quantos álbuns cada artista lançou?
-- Conceitos: JOIN, GROUP BY, COUNT, ORDER BY

SELECT 
    a.nome AS artista,
    COUNT(al.id) AS total_albuns,
    MIN(al.ano_lancamento) AS primeiro_album,
    MAX(al.ano_lancamento) AS ultimo_album
FROM artistas a
INNER JOIN albuns al ON a.id = al.artista_id
GROUP BY a.nome
ORDER BY total_albuns DESC;
