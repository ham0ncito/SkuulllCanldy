<?php
namespace Dao\Offersubscriptions; 
use Dao\Table; 
class Offersubscriptions extends Table{
      private $id_offer;
  private $id_subscription;
  private $price_offer;

 
  public static function getOffersubscription(){
	 $sqlstr= "SELECT * FROM offersubscription";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertOffersubscription($id_offer, $id_subscription, $price_offer){
	
    $sqlstr = "INSERT INTO offersubscription (id_offer, id_subscription, price_offer) VALUES (:id_offer , :id_subscription , :price_offer)";
    $params = ['id_offer' => $id_offer, 'id_subscription' => $id_subscription, 'price_offer' => $price_offer];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateOffersubscription($id_offer, $id_subscription, $price_offer){
	
        $sqlstr = "UPDATE offersubscription SET id_offer = :id_offer, id_subscription = :id_subscription, price_offer = :price_offer WHERE id_offer = :id_offer";
        $params = ['id_offer' => $id_offer, 'id_subscription' => $id_subscription, 'price_offer' => $price_offer];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM offersubscription WHERE id_offer = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteOffersubscription($id){
	$sqlstr= "DELETE  FROM offersubscription WHERE id_offer = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}