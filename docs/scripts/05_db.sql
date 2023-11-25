CREATE TABLE `artist` (
  `id_artist` varchar(500) PRIMARY KEY NOT NULL,
  `name_artist` varchar(200),
  `image_artist` varchar(200),
  `date_of_birth_artist` date,
  `country_artist` varchar(200),
  `albums` varchar(255),
  `status_artist` varchar(5),
  `artist_bio` varchar(200),
  `popularity_artist` decimal(12,2)
);

CREATE TABLE `favorites` (
  `id_favorite` varchar(500) PRIMARY KEY NOT NULL,
  `id_user` varchar(500),
  `id_reference` varchar(500),
  `type_favorite` varchar(5)
);

CREATE TABLE `video` (
  `id_video` varchar(500) PRIMARY KEY,
  `title_video` varchar(500),
  `description_video` varchar(500),
  `duration` int,
  `video_cover` varchar(500),
  `artist_id` varchar(255),
  `status_video` varchar(5),
  `link_song` varchar(500)
);

CREATE TABLE `popularity` (
  `id_popularity` varchar(500) PRIMARY KEY,
  `popularity_last_update_at` datetime
);

CREATE TABLE `videoPopularity` (
  `id_popularity` varchar(255),
  `id_video` varchar(255),
  `dislike_count` double,
  `like_count` double,
  `percent_dislike` decimal(12,2),
  `percent_like` decimal(12,2)
);

CREATE TABLE `playlistPopularity` (
  `id_popularity` varchar(255),
  `id_playlist` varchar(255),
  `dislike_count` double,
  `like_count` double,
  `percent_dislike` decimal(12,2),
  `percent_like` decimal(12,2)
);

CREATE TABLE `artistPopularity` (
  `id_popularity` varchar(255),
  `id_artist` varchar(255),
  `dislike_count` double,
  `like_count` double,
  `percent_dislike` decimal(12,2),
  `percent_like` decimal(12,2)
);

CREATE TABLE `songPopularity` (
  `id_popularity` varchar(255),
  `id_song` varchar(255),
  `dislike_count` double,
  `like_count` double,
  `percent_dislike` decimal(12,2),
  `percent_like` decimal(12,2)
);

CREATE TABLE `playlist` (
  `id_playlist` varchar(500) PRIMARY KEY NOT NULL,
  `playlist_name` varchar(100),
  `playlist_description` varchar(100),
  `playlist_image` varchar(100),
  `playlist_create_at` datetime,
  `playlist_status` varchar(5)
);

CREATE TABLE `highligths` (
  `highligths_id` varchar(500) PRIMARY KEY NOT NULL,
  `highligths_starts_at` datetime,
  `highligths_ends_at` datetime,
  `highligths_time` int
);

CREATE TABLE `highligthsPlaylist` (
  `highligths_id` varchar(255),
  `playlist_id` varchar(255),
  `highligths_description` varchar(255),
  PRIMARY KEY (`highligths_id`, `playlist_id`)
);

CREATE TABLE `playlistSongs` (
  `playlist_id` varchar(255) PRIMARY KEY,
  `song_id` varchar(255),
  `playlistSong_added_at` datetime,
  `playlistSong_status` varchar(5)
);

CREATE TABLE `album` (
  `id_album` varchar(500) PRIMARY KEY NOT NULL,
  `title_album` varchar(255),
  `image_album` varchar(255),
  `release_date_album` date,
  `number_of_songs_album` int,
  `artist_id` varchar(255),
  `songs_id` varchar(255),
  `status_album` varchar(5)
);

CREATE TABLE `genre` (
  `id_genre` varchar(500) PRIMARY KEY NOT NULL,
  `name_genre` varchar(255),
  `description_genre` varchar(255),
  `status_genre` varchar(5)
);

CREATE TABLE `song` (
  `id_song` varchar(500) PRIMARY KEY,
  `title_song` varchar(500),
  `duration` int,
  `song_cover` varchar(500),
  `album_id` varchar(255),
  `status_song` varchar(5),
  `link_song` varchar(500)
);

CREATE TABLE `songAuthors` (
  `artist_id` varchar(255),
  `song_id` varchar(255),
  `song_author_created_at` datetime,
  `song_author_last_update_at` datetime
);

CREATE TABLE `log` (
  `log_cod` varchar(100),
  `log_description` varchar(20)
);

CREATE TABLE `logUser` (
  `user_cod` bigint NOT NULL,
  `log_cod` varchar(255) NOT NULL,
  `date` datetime,
  PRIMARY KEY (`user_cod`, `log_cod`)
);



CREATE TABLE `subscription` (
  `id_subscription` varchar(400) PRIMARY KEY NOT NULL,
  `subscription_description` varchar(255),
  `subscription_duration` int,
  `subscription_price` decimal(12,2)
);

CREATE TABLE `offer` (
  `id_offer` varchar(500) PRIMARY KEY NOT NULL,
  `offer_description` varchar(500),
  `offer_starts_at` datetime,
  `offer_ends_at` datetime,
  `offer_status` varchar(5)
);

CREATE TABLE `offerSubscription` (
  `id_offer` varchar(255) NOT NULL,
  `id_subscription` varchar(255) NOT NULL,
  `price_offer` decimal(12,2),
  PRIMARY KEY (`id_offer`, `id_subscription`)
);

CREATE TABLE `subscriptionUser` (
  `id_subscription_user` varchar(255) NOT NULL,
  `id_subscription_subscription` varchar(255) NOT NULL,
  `purchase_date_subscription` datetime,
  `purchase_date_end` datetime,
  `status_subscription` varchar(5),
  PRIMARY KEY (`id_subscription_user`, `id_subscription_subscription`)
);

CREATE TABLE `shoppingCart` (
  `user_cod_ShoppingCart` int,
  `id_subscription` varchar(255),
  `shoppingCart_quantity` int,
  `shoppingCart_price` decimal(12,2),
  PRIMARY KEY (`user_cod_ShoppingCart`, `id_subscription`)
);

CREATE TABLE `logNonUser` (
  `id_logNonUser` varchar(1000),
  `log_date` datetime,
  `id_cookie` varchar(100),
  `log_cod` varchar(255) NOT NULL,
  PRIMARY KEY (`id_logNonUser`, `log_cod`)
);

ALTER TABLE `artist`
ADD FOREIGN KEY (`albums`) REFERENCES `album` (`id_album`);

ALTER TABLE `user`
ADD FOREIGN KEY (`user_cod`) REFERENCES `favorites` (`id_user`);

ALTER TABLE `video`
ADD FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id_artist`);

ALTER TABLE `popularity`
ADD FOREIGN KEY (`id_popularity`) REFERENCES `videoPopularity` (`id_popularity`);

ALTER TABLE `video`
ADD FOREIGN KEY (`id_video`) REFERENCES `videoPopularity` (`id_video`);

ALTER TABLE `popularity`
ADD FOREIGN KEY (`id_popularity`) REFERENCES `playlistPopularity` (`id_popularity`);

ALTER TABLE `playlist`
ADD FOREIGN KEY (`id_playlist`) REFERENCES `playlistPopularity` (`id_playlist`);

ALTER TABLE `popularity`
ADD FOREIGN KEY (`id_popularity`) REFERENCES `artistPopularity` (`id_popularity`);

ALTER TABLE `artist`
ADD FOREIGN KEY (`id_artist`) REFERENCES `artistPopularity` (`id_artist`);

ALTER TABLE `popularity`
ADD FOREIGN KEY (`id_popularity`) REFERENCES `songPopularity` (`id_popularity`);

ALTER TABLE `song`
ADD FOREIGN KEY (`id_song`) REFERENCES `songPopularity` (`id_song`);

ALTER TABLE `highligthsPlaylist`
ADD FOREIGN KEY (`highligths_id`) REFERENCES `highligths` (`highligths_id`);

ALTER TABLE `highligthsPlaylist`
ADD FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id_playlist`);

ALTER TABLE `playlistSongs`
ADD FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id_playlist`);

ALTER TABLE `playlistSongs`
ADD FOREIGN KEY (`song_id`) REFERENCES `song` (`id_song`);

ALTER TABLE `album`
ADD FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id_artist`);

ALTER TABLE `album`
ADD FOREIGN KEY (`id_album`) REFERENCES `song` (`album_id`);

ALTER TABLE `artist`
ADD FOREIGN KEY (`id_artist`) REFERENCES `songAuthors` (`artist_id`);

ALTER TABLE `songAuthors`
ADD FOREIGN KEY (`song_id`) REFERENCES `song` (`id_song`);

ALTER TABLE `logUser`
ADD FOREIGN KEY (`user_cod`) REFERENCES `user` (`user_cod`);

ALTER TABLE `logUser`
ADD FOREIGN KEY (`log_cod`) REFERENCES `log` (`log_cod`);

ALTER TABLE `roleUser`
ADD FOREIGN KEY (`user_cod`) REFERENCES `user` (`user_cod`);

ALTER TABLE `roleUser`
ADD FOREIGN KEY (`roles_cod`) REFERENCES `role` (`role_cod`);

ALTER TABLE `functionRole`
ADD FOREIGN KEY (`role_cod`) REFERENCES `role` (`role_cod`);

ALTER TABLE `functionRole`
ADD FOREIGN KEY (`fn_cod`) REFERENCES `function` (`fn_cod`);

ALTER TABLE `offerSubscription`
ADD FOREIGN KEY (`id_offer`) REFERENCES `offer` (`id_offer`);

ALTER TABLE `offerSubscription`
ADD FOREIGN KEY (`id_subscription`) REFERENCES `subscription` (`id_subscription`);

ALTER TABLE `subscriptionUser`
ADD FOREIGN KEY (`id_subscription_user`) REFERENCES `subscription` (`id_subscription`);

ALTER TABLE `subscriptionUser`
ADD FOREIGN KEY (`id_subscription_subscription`) REFERENCES `subscription` (`id_subscription`);

ALTER TABLE `shoppingCart`
ADD FOREIGN KEY (`user_cod_ShoppingCart`) REFERENCES `user` (`user_cod`);

ALTER TABLE `shoppingCart`
ADD FOREIGN KEY (`id_subscription`) REFERENCES `subscription` (`id_subscription`);

ALTER TABLE `logNonUser`
ADD FOREIGN KEY (`log_cod`) REFERENCES `log` (`log_cod`);



