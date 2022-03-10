SELECT cancoes.cancao_name AS 'cancao',
COUNT(*) AS 'reproducoes'
FROM SpotifyClone.history
JOIN SpotifyClone.cancoes ON cancoes.id_cancao = history.id_cancao
GROUP BY cancoes.cancao_name
HAVING reproducoes > 1
ORDER BY cancoes.cancao_name ASC LIMIT 2;
