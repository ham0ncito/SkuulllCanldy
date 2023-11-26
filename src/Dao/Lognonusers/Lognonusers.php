<?php
namespace Dao\Lognonusers; 
use Dao\Table; 
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