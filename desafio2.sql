SELECT (SELECT COUNT(*) FROM SpotifyClone.cancoes) AS cancoes,
(SELECT COUNT(*) FROM SpotifyClone.artist) AS artistas,
(SELECT COUNT(*) FROM SpotifyClone.albums) AS albums;
