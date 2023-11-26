<?php
namespace Dao\Highligthss; 
use Dao\Table; 
class Highligthss extends Table{
      private $highligths_id;
  private $highligths_starts_at;
  private $highligths_ends_at;
  private $highligths_time;

 
  public static function getHighligths(){
	 $sqlstr= "SELECT * FROM highligths";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertHighligths($highligths_id, $highligths_starts_at, $highligths_ends_at, $highligths_time){
	
    $sqlstr = "INSERT INTO highligths (highligths_id, highligths_starts_at, highligths_ends_at, highligths_time) VALUES (:highligths_id , :highligths_starts_at , :highligths_ends_at , :highligths_time)";
    $params = ['highligths_id' => $highligths_id, 'highligths_starts_at' => $highligths_starts_at, 'highligths_ends_at' => $highligths_ends_at, 'highligths_time' => $highligths_time];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateHighligths($highligths_id, $highligths_starts_at, $highligths_ends_at, $highligths_time){
	
        $sqlstr = "UPDATE highligths SET highligths_id = :highligths_id, highligths_starts_at = :highligths_starts_at, highligths_ends_at = :highligths_ends_at, highligths_time = :highligths_time WHERE highligths_id = :highligths_id";
        $params = ['highligths_id' => $highligths_id, 'highligths_starts_at' => $highligths_starts_at, 'highligths_ends_at' => $highligths_ends_at, 'highligths_time' => $highligths_time];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM highligths WHERE highligths_id = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteHighligths($id){
	$sqlstr= "DELETE  FROM highligths WHERE highligths_id = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}