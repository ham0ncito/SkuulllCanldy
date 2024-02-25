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
namespace Dao\Popularitys; 
use Dao\Table; 
/*El siguiente codigo se encarga de hacer las consultas CRUD para la clase del mismo nombre*/
class Popularitys extends Table{
    
  private $id_popularity;
  private $id_object;
  private $dislike_count;
  private $like_count;
  private $percent_dislike;
  private $percent_like;
  private $type_object;

 
  public static function getPopularity(){
	 $sqlstr= "SELECT * FROM popularity";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertPopularity($id_popularity, $id_object, $dislike_count, $like_count, $percent_dislike, $percent_like, $type_object){
	
    $sqlstr = "INSERT INTO popularity (id_popularity, id_object, dislike_count, like_count, percent_dislike, percent_like, type_object) VALUES (:id_popularity , :id_object , :dislike_count , :like_count , :percent_dislike , :percent_like , :type_object)";
    $params = ['id_popularity' => $id_popularity, 'id_object' => $id_object, 'dislike_count' => $dislike_count, 'like_count' => $like_count, 'percent_dislike' => $percent_dislike, 'percent_like' => $percent_like, 'type_object' => $type_object];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updatePopularity($id_popularity, $id_object, $dislike_count, $like_count, $percent_dislike, $percent_like, $type_object){
	
        $sqlstr = "UPDATE popularity SET id_popularity = :id_popularity, id_object = :id_object, dislike_count = :dislike_count, like_count = :like_count, percent_dislike = :percent_dislike, percent_like = :percent_like, type_object = :type_object WHERE id_popularity = :id_popularity";
        $params = ['id_popularity' => $id_popularity, 'id_object' => $id_object, 'dislike_count' => $dislike_count, 'like_count' => $like_count, 'percent_dislike' => $percent_dislike, 'percent_like' => $percent_like, 'type_object' => $type_object];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM popularity WHERE id_popularity = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deletePopularity($id){
	$sqlstr= "DELETE  FROM popularity WHERE id_popularity = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}