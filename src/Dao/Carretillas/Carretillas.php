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

namespace Dao\Carretillas;

use Dao\Table;
/*El siguiente codigo se encarga de hacer las consultas CRUD para la clase del mismo nombre*/

class Carretillas extends Table
{

        private $usercod;
        private $productId;
        private $crrctd;
        private $crrprc;
        private $crrfching;


        public static function getCarretilla()
        {
                $sqlstr = "SELECT * FROM carretilla";
                $params = [];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }
        public static function getCarretillaByUser($usercod)
        {
                $sqlstr = "SELECT carrito.* FROM carretilla as carrito INNER JOIN products as product on product.productId = carrito.productId where usercod = :usercod ";
                $params = ['usercod'=> $usercod];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }

        public static function insertCarretilla($usercod, $productId, $crrctd, $crrprc, $crrfching)
        {

                $sqlstr = "INSERT INTO carretilla (usercod, productId, crrctd, crrprc, crrfching) VALUES (:usercod , :productId , :crrctd , :crrprc , :crrfching)";
                $params = ['usercod' => $usercod, 'productId' => $productId, 'crrctd' => $crrctd, 'crrprc' => $crrprc, 'crrfching' => $crrfching];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function updateCarretilla($usercod, $productId, $crrctd, $crrprc, $crrfching)
        {

                $sqlstr = "UPDATE carretilla SET usercod = :usercod, productId = :productId, crrctd = :crrctd, crrprc = :crrprc, crrfching = :crrfching WHERE usercod = :usercod";
                $params = ['usercod' => $usercod, 'productId' => $productId, 'crrctd' => $crrctd, 'crrprc' => $crrprc, 'crrfching' => $crrfching];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function obtenerPorId($id)
        {
                $sqlstr = "SELECT * FROM carretilla WHERE usercod = :id";
                $params = ['id' => $id];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }

        public static function deleteCarretilla($id)
        {
                $sqlstr = "DELETE  FROM carretilla WHERE usercod = :id";
                $params = ['id' => $id];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }
}