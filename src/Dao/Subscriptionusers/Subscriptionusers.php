<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Dao\Subscriptionusers;

use Dao\Table;

class Subscriptionusers extends Table
{

        private $usercod;
        private $id_subscription;
        private $purchase_date_subscription;
        private $purchase_date_end;
        private $status_subscription;


        public static function getSubscriptionuser()
        {
                $sqlstr = "SELECT * FROM subscriptionuser";
                $params = [];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }
        public static function getSubscriptionuserExist($usercod)
        {
                $sqlstr = "SELECT * FROM subscriptionuser WHERE usercod = :usercod";
                $params = ["usercod" => $usercod];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }
        public static function getSubscriptionuserEnds($usercod)
        {
                $sqlstr = "SELECT purchase_date_end FROM subscriptionuser WHERE usercod = :usercod";
                $params = ["usercod" => $usercod];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }
        
       
        public static function insertSubscriptionuser($usercod, $id_subscription, $purchase_date_subscription, $purchase_date_end, $status_subscription)
        {

                $sqlstr = "INSERT INTO subscriptionuser (usercod, id_subscription, purchase_date_subscription, purchase_date_end, status_subscription) VALUES (:usercod , :id_subscription , :purchase_date_subscription , :purchase_date_end , :status_subscription)";
                $params = ['usercod' => $usercod, 'id_subscription' => $id_subscription, 'purchase_date_subscription' => $purchase_date_subscription, 'purchase_date_end' => $purchase_date_end, 'status_subscription' => $status_subscription];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function updateSubscriptionuser($usercod, $id_subscription, $purchase_date_subscription, $purchase_date_end, $status_subscription)
        {

                $sqlstr = "UPDATE subscriptionuser SET usercod = :usercod, id_subscription = :id_subscription, purchase_date_subscription = :purchase_date_subscription, purchase_date_end = :purchase_date_end, status_subscription = :status_subscription WHERE usercod = :usercod";
                $params = ['usercod' => $usercod, 'id_subscription' => $id_subscription, 'purchase_date_subscription' => $purchase_date_subscription, 'purchase_date_end' => $purchase_date_end, 'status_subscription' => $status_subscription];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function obtenerPorId($id)
        {
                $sqlstr = "SELECT * FROM subscriptionuser WHERE usercod = :id";
                $params = ['id' => $id];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }

        public static function deleteSubscriptionuser($id)
        {
                $sqlstr = "DELETE  FROM subscriptionuser WHERE usercod = :id";
                $params = ['id' => $id];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }
}