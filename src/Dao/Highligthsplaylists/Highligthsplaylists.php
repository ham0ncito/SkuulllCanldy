<?php
namespace Dao\Highligthsplaylists; 
use Dao\Table; 
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