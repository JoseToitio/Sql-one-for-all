SELECT user.username AS 'usuario',
COUNT(DISTINCT(cancoes.cancao_name)) AS 'qtde_musicas_ouvidas',
ROUND(SUM(cancoes.cancao_time) / 60, 2) AS 'total_minutos'
FROM SpotifyClone.history INNER JOIN SpotifyClone.user ON user.username = history.username
INNER JOIN SpotifyClone.cancoes on cancoes.cancao_name = history.cancao_name
GROUP BY user.username;
