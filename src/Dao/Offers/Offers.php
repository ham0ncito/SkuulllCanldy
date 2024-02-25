<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticker Number : 23
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
namespace Dao\Offers; 
use Dao\Table; 
class Offers extends Table{
    
  private $id_offer;
  private $offer_description;
  private $offer_starts_at;
  private $offer_ends_at;
  private $offer_status;

 
  public static function getOffer(){
	 $sqlstr= "SELECT * FROM offer";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertOffer($id_offer, $offer_description, $offer_starts_at, $offer_ends_at, $offer_status){
	
    $sqlstr = "INSERT INTO offer (id_offer, offer_description, offer_starts_at, offer_ends_at, offer_status) VALUES (:id_offer , :offer_description , :offer_starts_at , :offer_ends_at , :offer_status)";
    $params = ['id_offer' => $id_offer, 'offer_description' => $offer_description, 'offer_starts_at' => $offer_starts_at, 'offer_ends_at' => $offer_ends_at, 'offer_status' => $offer_status];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateOffer($id_offer, $offer_description, $offer_starts_at, $offer_ends_at, $offer_status){
	
        $sqlstr = "UPDATE offer SET id_offer = :id_offer, offer_description = :offer_description, offer_starts_at = :offer_starts_at, offer_ends_at = :offer_ends_at, offer_status = :offer_status WHERE id_offer = :id_offer";
        $params = ['id_offer' => $id_offer, 'offer_description' => $offer_description, 'offer_starts_at' => $offer_starts_at, 'offer_ends_at' => $offer_ends_at, 'offer_status' => $offer_status];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM offer WHERE id_offer = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteOffer($id){
	$sqlstr= "DELETE  FROM offer WHERE id_offer = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}