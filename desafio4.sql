SELECT user.username AS usuario,
IF(MAX(year(history.history_date)) >= '2021', "Usuário ativo", "Usuário inativo")
AS 'condicao_usuario'
FROM SpotifyClone.user
JOIN SpotifyClone.history ON history.id_user_follow = user.id_user
GROUP BY user.username
ORDER BY user.username;
