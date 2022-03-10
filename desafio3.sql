SELECT user.username AS 'usuario',
COUNT(DISTINCT(cancoes.cancao_name)) AS 'qtde_musicas_ouvidas',
ROUND(SUM(cancoes.cancao_time) / 60, 2) AS 'total_minutos'
FROM SpotifyClone.user JOIN SpotifyClone.history ON history.username = user.username
JOIN SpotifyClone.cancoes ON cancoes.id_cancao = history.id_cancao
GROUP BY user.username
ORDER BY user.username;
