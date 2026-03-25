-- Query 6: Quais playlists têm mais de 20 músicas?
-- Conceitos: GROUP BY, HAVING, COUNT, JOIN

SELECT 
    p.nome AS playlist,
    p.seguidores,
    COUNT(pm.musica_id) AS total_musicas
FROM playlists p
INNER JOIN playlist_musicas pm ON p.id = pm.playlist_id
GROUP BY p.nome, p.seguidores
HAVING COUNT(pm.musica_id) > 20
ORDER BY total_musicas DESC;
