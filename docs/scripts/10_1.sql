ALTER TABLE album
ADD CONSTRAINT fk_artist
FOREIGN KEY (id_artist) 
REFERENCES artist(id_artist);

ALTER TABLE album
ADD CONSTRAINT fk_genre
FOREIGN KEY (id_genre) 
REFERENCES genre(id_genre);

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) 
VALUES 
    (SHA2("Adele21", 256), '21', 'https://th.bing.com/th/id/R.4cf681fae9fc85f12650805a1ec86551?rik=tG3NFIwDk7y%2fbw&pid=ImgRaw&r=0', '2012-01-01', 15, '10c2d630409d5a4b8132f21478f40a030b8aefb29ab1a541da6d884a0286a6dc', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
    (SHA2("BlueNeighbourhood", 256), 'Blue Neighbourhood', 'https://th.bing.com/th/id/OIP.B8VpZ27npErYbv-_ZLtdgwHaHa?w=600&h=600&rs=1&pid=ImgDetMain', '2013-02-02', 18, 'e0b9f1c88709d143c8c1dcefac53e75cd810cc54dbc35fe2bb8b561b7fab72ce', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
    (SHA2("BornToDie", 256), 'Born To Die', 'https://th.bing.com/th/id/R.182b2f15445c91c521b063bceeb75dae?rik=p4s53jfOOWN%2f4w&pid=ImgRaw&r=0', '2023-03-03', 15, '0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');



INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) 
VALUES 
    (SHA2("Adelee21", 256), '21', 'https://th.bing.com/th/id/R.4cf681fae9fc85f12650805a1ec86551?rik=tG3NFIwDk7y%2fbw&pid=ImgRaw&r=0', '2012-01-01', 15, '10c2d630409d5a4b8132f21478f40a030b8aefb29ab1a541da6d884a0286a6dc', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
    (SHA2("BlueeNeighbourhood", 256), 'Blue Neighbourhood', 'https://th.bing.com/th/id/OIP.B8VpZ27npErYbv-_ZLtdgwHaHa?w=600&h=600&rs=1&pid=ImgDetMain', '2013-02-02', 18, 'e0b9f1c88709d143c8c1dcefac53e75cd810cc54dbc35fe2bb8b561b7fab72ce', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad'),
    (SHA2("BorenToDie", 256), 'Born To Die', 'https://th.bing.com/th/id/R.182b2f15445c91c521b063bceeb75dae?rik=p4s53jfOOWN%2f4w&pid=ImgRaw&r=0', '2023-03-03', 15, '0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');
INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("Honeymooon", 256), 'Honeymoon', 'https://th.bing.com/th/id/R.d3ae00889a3746c4cfde91183acb5c1c?rik=MLvyc18AzRn3ZQ&pid=ImgRaw&r=0', '2023-04-04', 12, '0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("KillThisLeove", 256), 'Kill This Love', 'https://th.bing.com/th/id/R.9546de89f64f25b5558c0c623536c6c7?rik=%2b2uJEXtI8enxNg&pid=ImgRaw&r=0', '2023-05-05', 8, '4a51977706f0a2d0473619ecdbc820a2f42739f87b46a8478f42389da553aebd', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("LoveYourseeelfBTS", 256), 'Love Yourself', 'https://th.bing.com/th/id/OIP.iZQmjlPIbOFaENe-z6b7EgHaHb?rs=1&pid=ImgDetMain', '2023-06-06', 10, '0779a9cf03c24adf40c8e20aa592def290119dd939b0ac5b3401e350a75b78c4', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("LustForLifee", 256), 'Lust For Life', 'https://th.bing.com/th/id/R.2f12f38c8e53357e86243cd3d26cf999?rik=0PxLDVEswkRZwg&pid=ImgRaw&r=0', '2023-07-07', 14, '0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("MindOfMinee", 256), 'Mind Of Mine', 'https://th.bing.com/th/id/R.fd3053cf930005782e5047e549407c26?rik=K6p9pDkpeRAm%2bA&pid=ImgRaw&r=0', '2023-08-08', 16, '6567207703cca3c6798f5d5f777307ac21cc708cf322d618925b2bccace800ea', 'ACT', '7b90ccc95230f095dd56b57ea9cbdd4f64bd33f5fde6968201bd551a97ba1460');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("HarryStyleees", 256), 'Harry Styles', 'https://m.media-amazon.com/images/I/61ON1kLVKOL._AC_SX569_.jpg', '2023-09-09', 11, '02978be3af7568a8491f44817a16cc8a716848284a1f6d2167473513f132f7a2', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("OneOfTheBoyes", 256), 'One Of the Boys', 'https://th.bing.com/th/id/R.2eddaa4ec1a38866bff326db39b2cfe6?rik=v1m005rGwIY8Rw&pid=ImgRaw&r=0', '2023-10-10', 13, '2b37d69d7b5cb4c1e7b3cc04dc2f41936b15f6ad04e93393f1b7343e98941f64', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("ParadiseLaeenaRey", 256), 'Paradise', 'https://31.media.tumblr.com/6ed32723211b08b33b4852f103e10dbe/tumblr_mxbduzheif1r861hjo1_1280.jpg', '2023-11-11', 9, '0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("SpeakNoweee", 256), 'Speak Now', 'https://th.bing.com/th/id/OIP.4alMO0aivpQLH04ylfBbBQHaHa?rs=1&pid=ImgDetMain', '2023-12-12', 17, 'c2ce09cb217d8d65cc7085546021ff3468401b68b634e963323f2bdfe030bc8e', 'ACT', '701d021d08c54579f23343581e45b65ffb1150b2c99f94352fdac4b7036dbbd5');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("ThankUNexeeet", 256), 'Thank u next', 'https://i.imgur.com/CQriKOF.jpg', '2019-01-01', 18, '6d93c4647d0738766d08682dec0c1ced423e41e21ccc83d59078a8c9f21ce8cd', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("TheFameMonseeeter", 256), 'The Fame Monster', 'https://th.bing.com/th/id/OIP.wNbeSQJeLeSNZhpeIno39AHaHa?rs=1&pid=ImgDetMain', '2024-02-02', 12, '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("TheThrillOfIteeeAll", 256), 'The Thrill of it all', 'https://th.bing.com/th/id/R.541b4755cc7386f0c470461328c09dc7?rik=GmfiUY3RBs80Fg&pid=ImgRaw&r=0', '2024-03-03', 14, '942ed3a371fa9c714abb580207ad665a7a9314a6475abcceed46c620f1fa2284', 'ACT', '4d616d53988e27e97423a7564dff09b644e2814d839751bccd589e05f29237ad');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("Ultraviolenceeeeeeee", 256), 'Ultraviolence', 'https://th.bing.com/th/id/R.24185b38a9e4c9f1ece22975ded2987f?rik=tRaaEbZw3PHdlQ&pid=ImgRaw&r=0', '2024-04-04', 11, '0bf18fd271f7a7d9f4c52373a642986722acedcd9e03ef383a765994c8e83910', 'ACT', 'f302f0ea1db5df02bef4e6520435b493640eff8cf840ac709d6b5e5f746b3f76');

INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES 
(SHA2("Unapologeticee", 256), 'Unapologetic', 'https://th.bing.com/th/id/OIP.v5w0NmXFcLRzHff142tangHaHb?rs=1&pid=ImgDetMain', '2024-05-05', 10, 'c2d4913d8ef080d76d32d2def25d6a58cff39216c2fe708393d09c27992e27e8','ACT', '7b90ccc95230f095dd56b57ea9cbdd4f64bd33f5fde6968201bd551a97ba1460');
