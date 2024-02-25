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
namespace Dao\Logusers; 
use Dao\Table; 
/*El siguiente codigo se encarga de hacer las consultas CRUD para la clase del mismo nombre*/
class Logusers extends Table{
    
  private $user_cod;
  private $log_cod;
  private $date;

 
  public static function getLoguser(){
	 $sqlstr= "SELECT * FROM loguser";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertLoguser($user_cod, $log_cod, $date){
	
    $sqlstr = "INSERT INTO loguser (user_cod, log_cod, date) VALUES (:user_cod , :log_cod , :date)";
    $params = ['user_cod' => $user_cod, 'log_cod' => $log_cod, 'date' => $date];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateLoguser($user_cod, $log_cod, $date){
	
        $sqlstr = "UPDATE loguser SET user_cod = :user_cod, log_cod = :log_cod, date = :date WHERE user_cod = :user_cod";
        $params = ['user_cod' => $user_cod, 'log_cod' => $log_cod, 'date' => $date];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM loguser WHERE user_cod = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteLoguser($id){
	$sqlstr= "DELETE  FROM loguser WHERE user_cod = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}