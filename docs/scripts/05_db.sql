CREATE TABLE IF NOT EXISTS `artist` (
  `id_artist` varchar(500) PRIMARY KEY NOT NULL,
  `name_artist` varchar(200),
  `image_artist` varchar(200),
  `date_of_birth_artist` date,
  `country_artist` varchar(200),
  `status_artist` varchar(5),
  `artist_bio` varchar(200),
  `popularity_artist` decimal(12,2)
);

CREATE TABLE IF NOT EXISTS `favorites` (
  `id_favorite` varchar(500) PRIMARY KEY NOT NULL,
  `usercod` varchar(500),
  `id_reference` varchar(500),
  `type_favorite` varchar(5)
);

CREATE TABLE IF NOT EXISTS `video` (
  `id_video` varchar(500) PRIMARY KEY,
  `title_video` varchar(500),
  `description_video` varchar(500),
  `duration` int,
  `video_cover` varchar(500),
  `artist_id` varchar(255),
  `status_video` varchar(5),
  `link_song` varchar(500)
);

CREATE TABLE IF NOT EXISTS `playlist` (
  `id_playlist` varchar(500) PRIMARY KEY NOT NULL,
  `playlist_name` varchar(100),
  `playlist_description` varchar(100),
  `playlist_image` varchar(100),
  `playlist_create_at` datetime,
  `playlist_status` varchar(5),
   `usercod` varchar(500)
);

CREATE TABLE IF NOT EXISTS `highligths` (
  `highligths_id` varchar(500) PRIMARY KEY NOT NULL,
  `highligths_starts_at` datetime,
  `highligths_ends_at` datetime,
  `highligths_time` int
);

CREATE TABLE IF NOT EXISTS `highligthsPlaylist` (
  `highligths_id` varchar(255),
  `playlist_id` varchar(255),
  `highligths_description` varchar(255),
  PRIMARY KEY (`highligths_id`, `playlist_id`)
);

CREATE TABLE IF NOT EXISTS `playlistSongs` (
  `playlist_id` varchar(255) PRIMARY KEY,
  `song_id` varchar(255),
  `playlistSong_added_at` datetime,
  `playlistSong_status` varchar(5)
);

CREATE TABLE IF NOT EXISTS `album` (
  `id_album` varchar(500) PRIMARY KEY NOT NULL,
  `title_album` varchar(255),
  `image_album` varchar(255),
  `release_date_album` date,
  `number_of_songs_album` int,
  `id_artist` varchar(255),
  `status_album` varchar(5),
  `id_genre`  varchar(500) not null
);

CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` varchar(500) PRIMARY KEY NOT NULL,
  `name_genre` varchar(255),
  `description_genre` varchar(255),
  `image_genre` varchar(255),
  `status_genre` varchar(5)
);

CREATE TABLE IF NOT EXISTS `song` (
  `id_song` varchar(500) PRIMARY KEY,
  `title_song` varchar(500),
  `duration` decimal(12,2) not null,
  `id_genre`  varchar(500) not null,
  `song_cover` varchar(500),
  `album_id` varchar(255),
  `status_song` varchar(5),
  `link_song` varchar(500)
);

CREATE TABLE IF NOT EXISTS `songAuthors` (
  `artist_id` varchar(255),
  `song_id` varchar(255),
  `song_author_created_at` datetime,
  `song_author_last_update_at` datetime
);

CREATE TABLE IF NOT EXISTS `log` (
  `log_cod` varchar(100),
  `log_description` varchar(20)
);

CREATE TABLE IF NOT EXISTS `logUser` (
  `user_cod` bigint NOT NULL,
  `log_cod` varchar(255) NOT NULL,
  `date` datetime,
  PRIMARY KEY (`user_cod`, `log_cod`)
);



CREATE TABLE IF NOT EXISTS `subscription` (
  `id_subscription` varchar(400) PRIMARY KEY NOT NULL,
  `subscription_description` varchar(255),
  `subscription_duration` int,
  `subscription_price` decimal(12,2)
);

CREATE TABLE IF NOT EXISTS `offer` (
  `id_offer` varchar(500) PRIMARY KEY NOT NULL,
  `offer_description` varchar(500),
  `offer_starts_at` datetime,
  `offer_ends_at` datetime,
  `offer_status` varchar(5)
);

CREATE TABLE IF NOT EXISTS `offerSubscription` (
  `id_offer` varchar(255) NOT NULL,
  `id_subscription` varchar(255) NOT NULL,
  `price_offer` decimal(12,2),
  PRIMARY KEY (`id_offer`, `id_subscription`)
);

CREATE TABLE IF NOT EXISTS `subscriptionUser` (
  `usercod` varchar(255) NOT NULL,
  `id_subscription` varchar(255) NOT NULL,
  `purchase_date_subscription` datetime,
  `purchase_date_end` datetime,
  `status_subscription` varchar(5),
  PRIMARY KEY (`usercod`, `id_subscription`)
);

CREATE TABLE IF NOT EXISTS `logNonUser` (
  `id_logNonUser` varchar(500),
  `log_date` datetime,
  `id_cookie` varchar(100),
  `log_cod` varchar(255) NOT NULL,
  PRIMARY KEY (`id_logNonUser`, `log_cod`)
);





