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
namespace Dao\Lognonusers; 
use Dao\Table; 
/*El siguiente codigo se encarga de hacer las consultas CRUD para la clase del mismo nombre*/
class Lognonusers extends Table{
    
  private $id_logNonUser;
  private $log_date;
  private $id_cookie;
  private $log_cod;

 
  public static function getLognonuser(){
	 $sqlstr= "SELECT * FROM lognonuser";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertLognonuser($id_logNonUser, $log_date, $id_cookie, $log_cod){
	
    $sqlstr = "INSERT INTO lognonuser (id_logNonUser, log_date, id_cookie, log_cod) VALUES (:id_logNonUser , :log_date , :id_cookie , :log_cod)";
    $params = ['id_logNonUser' => $id_logNonUser, 'log_date' => $log_date, 'id_cookie' => $id_cookie, 'log_cod' => $log_cod];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateLognonuser($id_logNonUser, $log_date, $id_cookie, $log_cod){
	
        $sqlstr = "UPDATE lognonuser SET id_logNonUser = :id_logNonUser, log_date = :log_date, id_cookie = :id_cookie, log_cod = :log_cod WHERE id_logNonUser = :id_logNonUser";
        $params = ['id_logNonUser' => $id_logNonUser, 'log_date' => $log_date, 'id_cookie' => $id_cookie, 'log_cod' => $log_cod];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM lognonuser WHERE id_logNonUser = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteLognonuser($id){
	$sqlstr= "DELETE  FROM lognonuser WHERE id_logNonUser = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}