DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos
(
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    name_plano CHAR(50) NOT NULL,
    valor DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artist
(
    id_artist INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums
(
    id_album INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(50) NOT NULL,
    id_artista INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artist(id_artist),
    ano_lancamento INT
) engine = InnoDB;

CREATE TABLE SpotifyClone.user
(
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(45) NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(id_plano),
    idade INT NOT NULL,
    signature_date DATETIME DEFAULT NOW()
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes
(
    id_cancao INTEGER PRIMARY KEY AUTO_INCREMENT,
    cancao_name VARCHAR(50) NOT NULL,
    id_album INT NOT NULL,
    FOREIGN KEY (id_album) REFERENCES albums(id_album),
    id_artist INT NOT NULL,
    FOREIGN KEY (id_artist) REFERENCES artist(id_artist),
    cancao_time INT
) engine = InnoDB;

CREATE TABLE SpotifyClone.history
(
    id_user_follow INT NOT NULL,
    id_cancao INT NOT NULL,
    PRIMARY KEY (id_user_follow, id_cancao),
    FOREIGN KEY (id_user_follow) REFERENCES user(id_user),
    FOREIGN KEY (id_cancao) REFERENCES cancoes(id_cancao),
    history_date TIMESTAMP NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.follow_artists
(
    id_user_follow INT NOT NULL,
    id_artist INT NOT NULL,
    PRIMARY KEY (id_user_follow, id_artist),
    FOREIGN KEY (id_user_follow) REFERENCES user(id_user),
    FOREIGN KEY (id_artist) REFERENCES artist(id_artist)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (name_plano, valor) 
VALUES
    ("gratuito", 0),
    ("familiar", 7.99),
    ("universitário", 5.99),
    ("pessoal", 6.99);

INSERT INTO SpotifyClone.artist (artist_name)
VALUES
    ("Walter Phoenix"),
    ("Peter Strong"),
    ("Lance Day"),
    ("Freedie Shannon"),
    ("Tyler Isle"),
    ("Fog");

INSERT INTO SpotifyClone.user (username, idade, plano_id, signature_date)
VALUES
    ("Thati", 23, 1, "2019-10-20"),
    ("Cintia", 35, 2, "2017-12-30"),
    ("Bill", 20, 3, "2019-06-05"),
    ("Roger", 45, 4, "2020-05-13"),
    ("Norman", 58, 4, "2017-02-17"),
    ("Patrick", 33, 2, "2017-01-06"),
    ("Vivian", 26, 3, "2018-01-05"),
    ("Carol", 19, 3, "2018-02-14"),
    ("Angelina", 42, 2 , "2018-04-29"),
    ("Paul", 46, 2, "2017-01-17");

INSERT INTO SpotifyClone.albums (album_name, id_artista, ano_lancamento)
VALUE
    ("Envious", 1, 1990),
    ("Exuberant", 1, 1993),
    ("Hallowed Steam", 2, 1995),
    ("Incandescent", 3, 1998),
    ("Temporary Culture", 4, 2001),
    ("Library of liberty", 4, 2003),
    ("Chained Down", 5, 2007),
    ("Cabinet of fools", 5, 2012),
    ("No guarantees", 5, 2015),
    ("Apparatus", 6, 2015);

INSERT INTO SpotifyClone.cancoes (cancao_name, cancao_time, id_artist, id_album)
VALUES
    ("Baby", 136, 6, 10),
    ("Celebration Of More", 146, 3, 4 ),
    ("Dance With Her Own", 116, 1, 1 ),
    ("Diamond Power", 241, 3, 4 ),
    ("Fantasy For Me", 100, 3, 4 ),
    ("Finding My Traditions", 179, 5, 7 ),
    ("Hard And Time", 135, 5, 7 ),
    ("He Heard You're Bad For Me", 154, 5, 8 ),
    ("He Hopes We Can't Stay", 210, 5, 8 ),
    ("He's Trouble", 138, 5, 9 ),
    ("He's Walking Away", 159, 5, 9 ),
    ("History Of My Roses", 222, 4, 6 ),
    ("Home Forever", 231, 3, 4 ),
    ("Honey, I'm A Lone Wolf", 150, 5, 7 ),
    ("Honey, So Do I", 207, 2, 3 ),
    ("Honey", 79, 5, 7 ),
    ("I Heard I Want To Bo Alone", 120, 5, 9 ),
    ("I Know I Know", 117, 5, 8 ),
    ("I Ride Alone", 151, 5, 9 ),
    ("Let's Be Silly", 132, 3, 4 ),
    ("Magic Circus", 105, 2, 3 ),
    ("Need Of The Evening", 190, 4, 6 ),
    ("Reflections Of Magic", 163, 1, 1 ),
    ("Rock His Everything", 223, 3, 4 ),
    ("She Knows", 244, 2, 3 ),
    ("She Thinks I Won't Stay Tonight", 166, 5, 8 ),
    ("Sweetie, Let's Go Wild", 139, 2, 3 ),
    ("Thang Of Thunder", 240, 4, 5  ),
    ("Time Fireworks", 152, 1, 2 ),
    ("Troubles Of My Inner Fire", 203, 1, 2 ),
    ("Walking And Game", 123, 4, 6 ),
    ("Walking And Man", 229, 5, 7 ),
    ("Without My Love", 111, 4, 6 ),
    ("Without My Streets", 176, 4, 5 ),
    ("Words Of Her Life", 185, 4, 5 ),
    ("Wouldn't It Be Nice", 213, 6, 10 ),
    ("You Cheated On Me", 95, 6, 10 ),
    ("You Make Me Feel So..", 83, 6, 10 ),
    ("Young And Father", 197, 4, 6 ),
    ("Soul For Us", 200, 1, 1 );

INSERT INTO SpotifyClone.history(id_user_follow, id_cancao, history_date)
VALUES
    (1, 16, '2020-02-28 10:45:55'),
    (1, 32, '2020-05-02 05:30:35'),
    (1, 39, '2020-03-06 11:22:33'),
    (1, 4, '2020-08-05 08:05:17'),
    (1, 20, '2020-09-14 16:32:22'),
    (2, 17, '2020-01-02 07:40:33'),
    (2, 6, '2020-05-16 06:16:22'),
    (2, 33, '2020-10-09 12:27:48'),
    (2, 1, '2020-09-21 13:14:46'),
    (3, 21, '2020-11-13 16:55:13'),
    (3, 3, '2020-12-05 18:38:30'),
    (3, 7, '2020-07-30 10:00:00'),
    (4, 23, '2021-08-15 17:10:10'),
    (4, 19, '2021-07-10 15:20:30'),
    (4, 14, '2021-01-09 01:44:33'),
    (5, 15, '2020-07-03 19:33:28'),
    (5, 24, '2017-02-24 21:14:22'),
    (5, 4, '2020-08-06 15:23:43'),
    (5, 40, '2020-11-10 13:52:27'),
    (6, 36, '2019-02-07 20:33:48'),
    (6, 8, '2017-01-24 00:31:17'),
    (6, 9, '2017-10-12 12:35:20'),
    (6, 31, '2018-05-29 14:56:41'),
    (7, 29, '2018-05-09 22:30:49'),
    (7, 30, '2020-07-27 12:52:58'),
    (7, 2, '2018-01-16 18:40:43'),
    (8, 1, '2018-03-21 16:56:40'),
    (8, 38, '2020-10-18 13:38:05'),
    (8, 11, '2019-05-25 08:14:03'),
    (8, 10, '2021-08-15 21:37:09'),
    (9, 28, '2021-05-24 17:23:45'),
    (9, 35, '2018-12-07 22:48:52'),
    (9, 27, '2021-03-14 06:14:26'),
    (9, 25, '2020-04-01 03:36:00'),
    (10, 12, '2017-02-06 08:21:34'),
    (10, 33, '2017-12-04 05:33:43'),
    (10, 24, '2017-07-27 05:24:49'),
    (10, 13, '2017-12-25 01:03:57');

INSERT INTO SpotifyClone.follow_artists(id_user_follow, id_artist)
VALUES
    (1, 1),
    (1, 4),
    (1, 3), 
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 3),
    (6, 1),
    (7, 2),
    (7, 5),
    (8, 1),
    (8, 5),
    (9, 6),
    (9, 4),
    (9, 3),
    (10, 2),
    (10, 6);
