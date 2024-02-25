<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Dao\Purchases;

use Dao\Table;

class Purchases extends Table
{

        private $id_purchase;
        private $purchase_date;
        private $total;
        private $details;
        private $payments;


        public static function getPurchase()
        {
                $sqlstr = "SELECT * FROM purchase";
                $params = [];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }
        public static function getPurchaseByUser($usercod)
        {
                $sqlstr = "SELECT purchase.*  FROM purchase as purchase INNER JOIN usuario as usuario ON usuario.usercod = purchase.usercod  where usuario.usercod = :usercod";
                $params = ['usercod' => $usercod];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }

        public static function insertPurchase($id_purchase, $purchase_date, $total, $details, $payments, $usercod)
        {

                $sqlstr = "INSERT INTO purchase (id_purchase, purchase_date, total, details, payments, usercod) VALUES (:id_purchase , :purchase_date , :total , :details , :payments, :usercod)";
                $params = ['id_purchase' => $id_purchase, 'purchase_date' => $purchase_date, 'total' => $total, 'details' => $details, 'payments' => $payments, 'usercod' =>$usercod];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function updatePurchase($id_purchase, $purchase_date, $total, $details, $payments)
        {

                $sqlstr = "UPDATE purchase SET id_purchase = :id_purchase, purchase_date = :purchase_date, total = :total, details = :details, payments = :payments WHERE id_purchase = :id_purchase";
                $params = ['id_purchase' => $id_purchase, 'purchase_date' => $purchase_date, 'total' => $total, 'details' => $details, 'payments' => $payments];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function obtenerPorId($id)
        {
                $sqlstr = "SELECT * FROM purchase WHERE id_purchase = :id";
                $params = ['id' => $id];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }

        public static function deletePurchase($id)
        {
                $sqlstr = "DELETE  FROM purchase WHERE id_purchase = :id";
                $params = ['id' => $id];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }
}