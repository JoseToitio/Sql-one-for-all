SELECT
CAST(MIN(planos.valor) AS DECIMAL(5,2)) AS faturamento_minimo,
CAST(MAX(planos.valor) AS DECIMAL(5,2)) AS faturamento_maximo,
CAST(AVG(planos.valor) AS DECIMAL(5,2)) AS faturamento_medio,
CAST(SUM(planos.valor) AS DECIMAL(5,2)) AS faturamento_total
FROM SpotifyClone.planos AS planos
JOIN SpotifyClone.user ON planos.id_plano = user.plano_id;
