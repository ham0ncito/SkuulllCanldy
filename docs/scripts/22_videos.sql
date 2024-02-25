--Ingreso de datos a la tabla Videos. Ingreso de datos para la tabla artista

INSERT INTO artist (id_artist, name_artist, image_artist, date_of_birth_artist, country_artist, status_artist, artist_bio)
VALUES
    ('e5aaccbe1ebafbca5e9fd2794431862f', 'Madonna', 'https://2.bp.blogspot.com/-R_G8feMd3Go/TbUb8IkIJdI/AAAAAAAAA9Y/dwv3FZIsGt0/s1600/madonna.jpg', '1958-08-16', 'United States', 'ACT', 'Madonna is a pop music singer and actress who went solo in 1981 and became a sensation in the then male-dominated 1980s music scene. She has achieved 21 Top 10 hits in the United States and sold more than 70 million albums internationally. In January 2008, she was named the worlds wealthiest female musician by Forbes magazine.');


ALTER TABLE video
ADD CONSTRAINT fk_video_artist FOREIGN KEY (artist_id) 
REFERENCES artist(id_artist);


INSERT INTO video (id_video, title_video, description_video, duration, video_cover, artist_id, status_video, link_song)
VALUES ('d14d1cb551064b87959ce062e49b8d4a', 'BAD ROMANCE DELUXE VIDEO', 'WORLD WAS TAKEN AWAY WHEN LADY GAGAS BAD ROMANCE BROKE UP THE SCENE, HERE WE SEE HERE IN A MORE INTIMATELY WAY, RAW, HOPELESS', 300, 'https://th.bing.com/th/id/OIP.MDtzspL9EC1B5grnJ36PbQHaHa?w=191&h=191&c=7&r=0&o=5&dpr=1.3&pid=1.7', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lady%20Gaga%20%20Bad%20Romance%20Official%20Music%20Video_1080p.mp4?alt=media&token=d8684e6e-6e46-4d21-a025-75e6d3ce0bbc');
INSERT INTO video (id_video, title_video, description_video, duration, video_cover, artist_id, status_video, link_song)
VALUES ('d14d1cb551064b87959ce062e49b8d4aASxc', 'BAD ROMANCE BEHIND SCENES', 'WORLD WAS TAKEN AWAY WHEN LADY GAGAS BAD ROMANCE BROKE UP THE SCENE, HERE WE SEE HERE IN A MORE INTIMATELY WAY, RAW, HOPELESS', 220, 'https://4.bp.blogspot.com/-qZfIoQOWFD0/UW23vWJrNDI/AAAAAAAALKI/e0e-OSs7G80/s0/Lady-Gaga-Bad-Romance-Music-Video-Screencaps-lady-gaga-19361986-1248-704.jpg', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lady%20Gaga%20%20Bad%20Romance%20Official%20Behind%20the%20Scenes_480p.mp4?alt=media&token=b88931fc-a48e-433e-9ecd-fe9291eb0e23');

INSERT INTO video (id_video, title_video, description_video, duration, video_cover, artist_id, status_video, link_song)
VALUES ('d14d1cb551064b87959ce062e49b8d4aASxSDDc', 'DUSSELDURF LADY GAGAS CONCERT', 'THIS IS LADY GAGAS DUSSELDURF CONCERT', 660, 'https://i.ytimg.com/vi/2N9OXjfsrps/hqdefault.jpg', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lady%20Gaga%20%20Opening%20%20Bad%20Romance%20Chromatica%20Ball%20%20D%C3%BCsseldorf%202022_1080pFHR.mp4?alt=media&token=0aabaa00-c3f4-43c7-966c-a0474a3aa671');

INSERT INTO video (id_video, title_video, description_video, duration, video_cover, artist_id, status_video, link_song)
VALUES ('d14d1cb551064b87959ce062e49b8d4SDSaASxNNSDDc', 'POKER FACE CONCERT EDITION', 'THIS IS LADY GAGAS DELUXE CONCERT AT NW HALL', 220, 'https://i.ytimg.com/vi/2N9OXjfsrps/hqdefault.jpg', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fvideoplayback.mp4?alt=media&token=4415cdef-1467-4d5c-9e79-4bcfab7f691d');
INSERT INTO video (id_video, title_video, description_video, duration, video_cover, artist_id, status_video, link_song)
VALUES ('d14d1cb551064b87959ce062e49b8d4SSSDSaSDASxNNSDDc', 'ALEJANDRO UNCENSORED EDITION', 'WHAT CAN WE SAY ABOUT ALEJANDRO? HONESTLY WE ARE STILL SHOCKED SINCE 2010', 540 ,'https://th.bing.com/th/id/R.e574ed855c89eff9fa3ba4a1a0abd72b?rik=grwtcKQxos60Eg&riu=http%3a%2f%2fimages4.fanpop.com%2fimage%2fphotos%2f19900000%2fAlejandro-lady-gaga-19977066-1238-798.jpg&ehk=bXhmNExLwiXAl6R3zcyVpMTJYbITDlo%2bX24SC%2b8wKF0%3d&risl=&pid=ImgRaw&r=0', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lady%20Gaga%20%20Alejandro%20Official%20Music%20Video_720p.mp4?alt=media&token=8d817ed4-414b-4a7c-95f3-40193f3feb63');

INSERT INTO video (id_video, title_video, description_video, duration, video_cover, artist_id, status_video, link_song)
VALUES ('d14d1cDFxb551064b87959ce062DSFXXe49b8d4SDSaSDASxNNSDDc', 'LADY GAGA JUDAS', 'WHAT CAN WE SAY ABOUT JUDAS? PROBABLY WE ARE IN LOVE TOO', 580 ,'https://th.bing.com/th/id/R.647d24f015308a81abe8506754413b65?rik=m54Ls%2feCdLQjlA&riu=http%3a%2f%2fimages4.fanpop.com%2fimage%2fphotos%2f21800000%2fLady-Gaga-Judas-Music-Video-lady-gaga-21875940-1700-802.jpg&ehk=aIx76O%2fHA7rjJhL3xxvxxTxX9kB2UugegSrb9dS3ySc%3d&risl=&pid=ImgRaw&r=0', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lady%20Gaga%20%20Judas%20Official%20Music%20Video_720p.mp4?alt=media&token=0828c702-3774-41ef-97f2-42591aa9193a');
INSERT INTO video (id_video, title_video, description_video, duration, video_cover, artist_id, status_video, link_song)
VALUES ('d14SDd1cb551064b87959ce062DSSDSDFXXe49b8d4SDSaSDASxNNSDDc', 'LADY GAGA LOVEGAME', 'ARE YOU ON A MISSION?', 540 ,'https://th.bing.com/th/id/R.92b3d6a72a5a3ba2626cccccd6487426?rik=oIZXuXTJpPwlyg&pid=ImgRaw&r=0', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Lady%20Gaga%20%20LoveGame%20Official%20Music%20Video_720p.mp4?alt=media&token=dab2e8d1-f760-4cea-b889-7be74d3f94d6');

INSERT INTO video (id_video, title_video, description_video, duration, video_cover, artist_id, status_video, link_song)
VALUES ('d14SDd1cb551064b87959ce062DSSDSDFXXe4fg439b8d4SDBNNAZ344SaSDASxSDSDsxcsNNSDDc', 'CHROMATICA DOCUMENTARY', 'EXPLORE LADY GAGA CHROMATICA IN A DEEPER WAY', 1320 ,'https://i.pinimg.com/originals/f9/35/f7/f935f783bec66c0214bd3a99b09009a5.jpg', '89a282db14063bd4abcd062207b99c896075536c54340929a06b880a025c497b', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20PROLOGUE%20Episode%201%20%20The%20Chromatica%20Ball%20Documentary_1080p.mp4?alt=media&token=a29c83cf-49d0-4101-9acf-d20b7c8f00e9');


INSERT INTO video (id_video, title_video, description_video, duration, video_cover, artist_id, status_video, link_song)
VALUES ('d14SDd1cb551064b87959ce062DSSDSDFXXe49xb8d4SDSaSDSDSXXASxSDSdfDsxcsNNSDDc', 'RIHANNA MAN DOWN', 'HOW DANGEROUS CAN LOVE BE?', 360, 'https://th.bing.com/th/id/R.9d520f4d9f1b6f86974ee8397cada0ad?rik=n0Pfck36VjQSXQ&riu=http%3a%2f%2fimages4.fanpop.com%2fimage%2fphotos%2f22500000%2fRihanna-Man-Down-rihanna-22547563-1117-517.jpg&ehk=JDPoCeKFND%2fKL1wg3yBsjcYLqsUQUBi6lJdss0SdpmU%3d&risl=&pid=ImgRaw&r=0', 'c2d4913d8ef080d76d32d2def25d6a58cff39216c2fe708393d09c27992e27e8', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Rihanna%20%20Man%20Down_480p.mp4?alt=media&token=907fe815-8b76-4e71-96c3-58e01b1eb578');

INSERT INTO video (id_video, title_video, description_video, duration, video_cover, artist_id, status_video, link_song)
VALUES ('d14SDd1cb551064b87959ce062DSSDSDFXXe49xDFb8d4SDSaSDASxSDSdfDsxcsNNSDDc', 'HUNG UP CONCERT DOCUMENTARY', 'TIMES GOES BY SO SLOWLY', 540, 'https://th.bing.com/th/id/OIP.O5iAboAkT6pMcTw6YHb24wHaEK?rs=1&pid=ImgDetMain', 'e5aaccbe1ebafbca5e9fd2794431862f', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Madonna%20%20Hung%20Up%20Live%20at%20the%202005%20MTV%20EMAs_720p.mp4?alt=media&token=76f5ad63-c8a4-475d-a2a5-49b1ba565379');


INSERT INTO video (id_video, title_video, description_video, duration, video_cover, artist_id, status_video, link_song)
VALUES ('d14SDd1cb551064b87959ce062DSSDSDFXXe49xDFbCVBB8d4SDSaSDASxSDSdfDsxcX35bnsNNSDDc', 'VOGUE  CONCERT DOCUMENTARY', 'TIMES GOES BY SO SLOWLY', 500 ,'https://th.bing.com/th/id/R.f33cadc676c4e558baf75058e90de44f?rik=pdF9223Ae2UGPA&pid=ImgRaw&r=0', 'e5aaccbe1ebafbca5e9fd2794431862f', 'ACT', 'https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Madonna%20%20Vogue%20Official%20Video_480p.mp4?alt=media&token=3d276720-4187-4124-93df-05ab4e0679e7');


ALTER TABLE `video` CHANGE `link_song` `link_video` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;