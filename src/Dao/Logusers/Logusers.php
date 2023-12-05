<?php
namespace Dao\Logusers; 
use Dao\Table; 
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