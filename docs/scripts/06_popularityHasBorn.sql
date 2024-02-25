-- Selecciona la base de datos 'skull2canldydb'
USE skull2canldydb;

-- Elimina las tablas 'popularity', 'artistpopularity', 'playlistpopularity', 'songpopularity' y 'videopopularity' si existen
DROP TABLE IF EXISTS popularity;
DROP TABLE IF EXISTS artistpopularity;
DROP TABLE IF EXISTS playlistpopularity;
DROP TABLE IF EXISTS songpopularity;
DROP TABLE IF EXISTS videopopularity;

-- Crea la tabla 'popularity' con las siguientes columnas:
-- 'id_popularity': Identificador de la popularidad (clave primaria)
-- 'id_object': Identificador del objeto
-- 'dislike_count': Conteo de dislikes
-- 'like_count': Conteo de likes
-- 'percent_dislike': Porcentaje de dislikes
-- 'percent_like': Porcentaje de likes
-- 'type_object': Tipo de objeto
CREATE TABLE popularity (
    id_popularity varchar(255) PRIMARY KEY NOT NULL,
    id_object varchar(255) NOT NULL,
    dislike_count double,
    like_count double,
    percent_dislike decimal(12,2),
    percent_like decimal(12,2),
    type_object varchar(255) 
);

-- Elimina la columna 'popularity_artist' de la tabla 'artist'
ALTER TABLE `artist` DROP `popularity_artist`;
