<?php

namespace Dao\Playlists;

use Dao\Table;

class Playlists extends Table
{

        private $id_playlist;
        private $playlist_name;
        private $playlist_description;
        private $playlist_image;
        private $playlist_create_at;
        private $playlist_status;
        private $usercod;


        public static function getPlaylist()
        {
                $sqlstr = "SELECT * FROM playlist";
                $params = [];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }
        public static function getPlaylistByUser($usercod)
        {
                $sqlstr = "SELECT * FROM playlist where usecod =:usecod";
                $params = ['usecod' => $usercod];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }

        public static function insertPlaylist($id_playlist, $playlist_name, $playlist_description, $playlist_image, $playlist_create_at, $playlist_status, $usercod)
        {

                $sqlstr = "INSERT INTO playlist (id_playlist, playlist_name, playlist_description, playlist_image, playlist_create_at, playlist_status, usercod) VALUES (:id_playlist , :playlist_name , :playlist_description , :playlist_image , :playlist_create_at , :playlist_status , :usercod)";
                $params = ['id_playlist' => $id_playlist, 'playlist_name' => $playlist_name, 'playlist_description' => $playlist_description, 'playlist_image' => $playlist_image, 'playlist_create_at' => $playlist_create_at, 'playlist_status' => $playlist_status, 'usercod' => $usercod];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function updatePlaylist($id_playlist, $playlist_name, $playlist_description, $playlist_image, $playlist_create_at, $playlist_status, $usercod)
        {

                $sqlstr = "UPDATE playlist SET id_playlist = :id_playlist, playlist_name = :playlist_name, playlist_description = :playlist_description, playlist_image = :playlist_image, playlist_create_at = :playlist_create_at, playlist_status = :playlist_status, usercod = :usercod WHERE id_playlist = :id_playlist";
                $params = ['id_playlist' => $id_playlist, 'playlist_name' => $playlist_name, 'playlist_description' => $playlist_description, 'playlist_image' => $playlist_image, 'playlist_create_at' => $playlist_create_at, 'playlist_status' => $playlist_status, 'usercod' => $usercod];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function obtenerPorId($id)
        {
                $sqlstr = "SELECT * FROM playlist WHERE id_playlist = :id";
                $params = ['id' => $id];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }

        public static function deletePlaylist($id)
        {
                $sqlstr = "DELETE  FROM playlist WHERE id_playlist = :id";
                $params = ['id' => $id];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }
}