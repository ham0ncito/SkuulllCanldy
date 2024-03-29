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
namespace Dao\Highligthsplaylists; 
use Dao\Table; 
/*El siguiente codigo se encarga de hacer las consultas CRUD para la clase del mismo nombre*/
class Highligthsplaylists extends Table{
    
  private $highligths_id;
  private $playlist_id;
  private $highligths_description;

 
  public static function getHighligthsplaylist(){
	 $sqlstr= "SELECT * FROM highligthsplaylist";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertHighligthsplaylist($highligths_id, $playlist_id, $highligths_description){
	
    $sqlstr = "INSERT INTO highligthsplaylist (highligths_id, playlist_id, highligths_description) VALUES (:highligths_id , :playlist_id , :highligths_description)";
    $params = ['highligths_id' => $highligths_id, 'playlist_id' => $playlist_id, 'highligths_description' => $highligths_description];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateHighligthsplaylist($highligths_id, $playlist_id, $highligths_description){
	
        $sqlstr = "UPDATE highligthsplaylist SET highligths_id = :highligths_id, playlist_id = :playlist_id, highligths_description = :highligths_description WHERE highligths_id = :highligths_id";
        $params = ['highligths_id' => $highligths_id, 'playlist_id' => $playlist_id, 'highligths_description' => $highligths_description];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM highligthsplaylist WHERE highligths_id = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteHighligthsplaylist($id){
	$sqlstr= "DELETE  FROM highligthsplaylist WHERE highligths_id = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}