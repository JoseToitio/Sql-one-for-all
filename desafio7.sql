SELECT artist.artist_name AS artista,
albums.album_name AS album,
COUNT(follow_artists.id_artist) AS seguidores
FROM SpotifyClone.artist
JOIN SpotifyClone.albums ON artist.id_artist = albums.id_artista
JOIN SpotifyClone.follow_artists ON albums.id_artista = follow_artists.id_artist
GROUP BY albums.album_name, artist.artist_name
ORDER BY seguidores DESC, artista, album;
