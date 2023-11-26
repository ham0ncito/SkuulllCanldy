<?php
namespace Dao\Carretillaanons; 
use Dao\Table; 
class Carretillaanons extends Table{
      private $anoncod;
  private $productId;
  private $crrctd;
  private $crrprc;
  private $crrfching;

 
  public static function getCarretillaanon(){
	 $sqlstr= "SELECT * FROM carretillaanon";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertCarretillaanon($anoncod, $productId, $crrctd, $crrprc, $crrfching){
	
    $sqlstr = "INSERT INTO carretillaanon (anoncod, productId, crrctd, crrprc, crrfching) VALUES (:anoncod , :productId , :crrctd , :crrprc , :crrfching)";
    $params = ['anoncod' => $anoncod, 'productId' => $productId, 'crrctd' => $crrctd, 'crrprc' => $crrprc, 'crrfching' => $crrfching];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateCarretillaanon($anoncod, $productId, $crrctd, $crrprc, $crrfching){
	
        $sqlstr = "UPDATE carretillaanon SET anoncod = :anoncod, productId = :productId, crrctd = :crrctd, crrprc = :crrprc, crrfching = :crrfching WHERE anoncod = :anoncod";
        $params = ['anoncod' => $anoncod, 'productId' => $productId, 'crrctd' => $crrctd, 'crrprc' => $crrprc, 'crrfching' => $crrfching];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM carretillaanon WHERE anoncod = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteCarretillaanon($id){
	$sqlstr= "DELETE  FROM carretillaanon WHERE anoncod = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}