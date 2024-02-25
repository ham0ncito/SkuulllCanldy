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
namespace Dao\Funcioness; 
use Dao\Table; 
class Funcioness extends Table{
    
  private $fncod;
  private $fndsc;
  private $fnest;
  private $fntyp;

 
  public static function getFunciones(){
	 $sqlstr= "SELECT * FROM funciones";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertFunciones($fncod, $fndsc, $fnest, $fntyp){
	
    $sqlstr = "INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES (:fncod , :fndsc , :fnest , :fntyp)";
    $params = ['fncod' => $fncod, 'fndsc' => $fndsc, 'fnest' => $fnest, 'fntyp' => $fntyp];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateFunciones($fncod, $fndsc, $fnest, $fntyp){
	
        $sqlstr = "UPDATE funciones SET fncod = :fncod, fndsc = :fndsc, fnest = :fnest, fntyp = :fntyp WHERE fncod = :fncod";
        $params = ['fncod' => $fncod, 'fndsc' => $fndsc, 'fnest' => $fnest, 'fntyp' => $fntyp];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM funciones WHERE fncod = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteFunciones($id){
	$sqlstr= "DELETE  FROM funciones WHERE fncod = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}