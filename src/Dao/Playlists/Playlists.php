<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticket Number : 23
 * Changes Approved on 20/2/24
 * Tested by Skullcanldy
 * Description: 
	This is the first documentation commit
 * Disclosure Agreement: 
	Keep this information in secret
 * Last changes done: 
	Documentation Added
	
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Dao\Playlists;

use Dao\Table;
/*El siguiente codigo se encarga de hacer las consultas CRUD para la clase del mismo nombre*/

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
                $sqlstr = "SELECT * FROM playlist where usercod =:usercod";
                $params = ['usercod' => $usercod];
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