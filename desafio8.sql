SELECT artist.artist_name AS artista,
albums.album_name AS album,
FROM SpotifyClone.artist
JOIN SpotifyClone.albums ON albums.id_artista = artist.id_artist
WHERE artist_name = 'Walter Phoenix'
ORDER BY album;
