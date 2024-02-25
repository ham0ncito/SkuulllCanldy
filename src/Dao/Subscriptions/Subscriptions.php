<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Dao\Subscriptions;

use Dao\Table;

class Subscriptions extends Table
{

        private $id_subscription;
        private $subscription_description;
        private $subscription_duration;
        private $subscription_price;


        public static function getSubscription()
        {
                $sqlstr = "SELECT * FROM subscription";
                $params = [];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }
        public static function getDuration($id)
        {
                $sqlstr = "SELECT subscription_duration FROM subscription WHERE id_subscription = :id";
                $params = ['id' => $id];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }
        
        public static function insertSubscription($id_subscription, $subscription_description, $subscription_duration, $subscription_price)
        {

                $sqlstr = "INSERT INTO subscription (id_subscription, subscription_description, subscription_duration, subscription_price) VALUES (:id_subscription , :subscription_description , :subscription_duration , :subscription_price)";
                $params = ['id_subscription' => $id_subscription, 'subscription_description' => $subscription_description, 'subscription_duration' => $subscription_duration, 'subscription_price' => $subscription_price];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function updateSubscription($id_subscription, $subscription_description, $subscription_duration, $subscription_price)
        {

                $sqlstr = "UPDATE subscription SET id_subscription = :id_subscription, subscription_description = :subscription_description, subscription_duration = :subscription_duration, subscription_price = :subscription_price WHERE id_subscription = :id_subscription";
                $params = ['id_subscription' => $id_subscription, 'subscription_description' => $subscription_description, 'subscription_duration' => $subscription_duration, 'subscription_price' => $subscription_price];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function obtenerPorId($id)
        {
                $sqlstr = "SELECT * FROM subscription WHERE id_subscription = :id";
                $params = ['id' => $id];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }

        public static function deleteSubscription($id)
        {
                $sqlstr = "DELETE  FROM subscription WHERE id_subscription = :id";
                $params = ['id' => $id];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }
}