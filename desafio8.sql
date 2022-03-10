SELECT artist.artist_name AS artista,
albums.album_name AS album,
FROM SpotifyClone.artist
JOIN SpotifyClone.albums ON artist.id_artista = albums.id_artista
LIMIT 2;
