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

namespace Dao\Purchasedetails;

use Dao\Table;
/*El siguiente codigo se encarga de hacer las consultas CRUD para la clase del mismo nombre*/

class Purchasedetails extends Table
{

        private $id_purchase;
        private $id_item_reference;
        private $quantity;
        private $unitary_price;


        public static function getPurchasedetail()
        {
                $sqlstr = "SELECT * FROM purchasedetail";
                $params = [];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }

        public static function insertPurchasedetail($id_purchase, $id_item_reference, $quantity, $unitary_price)
        {

                $sqlstr = "INSERT INTO purchasedetail (id_purchase, id_item_reference, quantity, unitary_price) VALUES (:id_purchase , :id_item_reference , :quantity , :unitary_price)";
                $params = ['id_purchase' => $id_purchase, 'id_item_reference' => $id_item_reference, 'quantity' => $quantity, 'unitary_price' => $unitary_price];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function updatePurchasedetail($id_purchase, $id_item_reference, $quantity, $unitary_price)
        {

                $sqlstr = "UPDATE purchasedetail SET id_purchase = :id_purchase, id_item_reference = :id_item_reference, quantity = :quantity, unitary_price = :unitary_price WHERE id_purchase = :id_purchase";
                $params = ['id_purchase' => $id_purchase, 'id_item_reference' => $id_item_reference, 'quantity' => $quantity, 'unitary_price' => $unitary_price];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function obtenerPorId($id)
        {
                $sqlstr = "SELECT * FROM purchasedetail WHERE id_purchase = :id";
                $params = ['id' => $id];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }

        public static function deletePurchasedetail($id)
        {
                $sqlstr = "DELETE  FROM purchasedetail WHERE id_purchase = :id";
                $params = ['id' => $id];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }
}