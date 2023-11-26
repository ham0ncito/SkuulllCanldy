USE skull2canldydb;

-- 
DROP TABLE IF EXISTS popularity;
DROP TABLE IF EXISTS artistpopularity;
DROP TABLE IF EXISTS playlistpopularity;
DROP TABLE IF EXISTS songpopularity;
DROP TABLE IF EXISTS videopopularity;

-- 
CREATE TABLE popularity (
    id_popularity varchar(255) PRIMARY KEY NOT NULL,
    id_object varchar(255) NOT NULL,
    dislike_count double,
    like_count double,
    percent_dislike decimal(12,2),
    percent_like decimal(12,2),
    type_object varchar(255) 
);

ALTER TABLE `artist` DROP `popularity_artist`;