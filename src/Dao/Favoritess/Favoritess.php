<?php

namespace Dao\Favoritess;

use Dao\Table;

class Favoritess extends Table
{

        private $id_favorite;
        private $usercod;
        private $id_reference;
        private $type_favorite;


        public static function getFavorites()
        {
                $sqlstr = "SELECT * FROM favorites";
                $params = [];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }

        public static function getFavoritesByUser($usercod)
        {
                $sqlstr = "SELECT * FROM favorites where usercod = :usercod";
                $params = ['usercod' => $usercod];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        } 
        public static function insertFavorites($id_favorite, $usercod, $id_reference, $type_favorite)
        {

                $sqlstr = "INSERT INTO favorites (id_favorite, usercod, id_reference, type_favorite) VALUES (:id_favorite , :usercod , :id_reference , :type_favorite)";
                $params = ['id_favorite' => $id_favorite, 'usercod' => $usercod, 'id_reference' => $id_reference, 'type_favorite' => $type_favorite];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function updateFavorites($id_favorite, $usercod, $id_reference, $type_favorite)
        {

                $sqlstr = "UPDATE favorites SET id_favorite = :id_favorite, usercod = :usercod, id_reference = :id_reference, type_favorite = :type_favorite WHERE id_favorite = :id_favorite";
                $params = ['id_favorite' => $id_favorite, 'usercod' => $usercod, 'id_reference' => $id_reference, 'type_favorite' => $type_favorite];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function obtenerPorId($id)
        {
                $sqlstr = "SELECT * FROM favorites WHERE id_favorite = :id";
                $params = ['id' => $id];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }

        public static function deleteFavorites($id)
        {
                $sqlstr = "DELETE  FROM favorites WHERE id_favorite = :id";
                $params = ['id' => $id];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }
}