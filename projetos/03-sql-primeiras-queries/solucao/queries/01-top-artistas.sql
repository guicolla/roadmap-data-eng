-- Query 1: Quais são os 10 artistas com mais seguidores?
-- Conceitos: SELECT, ORDER BY, LIMIT, formatação

SELECT 
    nome,
    pais,
    genero,
    seguidores
FROM artistas
ORDER BY seguidores DESC
LIMIT 10;
