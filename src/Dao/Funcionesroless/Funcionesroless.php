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
namespace Dao\Funcionesroless; 
use Dao\Table; 
class Funcionesroless extends Table{
    
  private $rolescod;
  private $fncod;
  private $fnrolest;
  private $fnexp;

 
  public static function getFunciones_roles(){
	 $sqlstr= "SELECT * FROM funciones_roles";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertFunciones_roles($rolescod, $fncod, $fnrolest, $fnexp){
	
    $sqlstr = "INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES (:rolescod , :fncod , :fnrolest , :fnexp)";
    $params = ['rolescod' => $rolescod, 'fncod' => $fncod, 'fnrolest' => $fnrolest, 'fnexp' => $fnexp];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateFunciones_roles($rolescod, $fncod, $fnrolest, $fnexp){
	
        $sqlstr = "UPDATE funciones_roles SET rolescod = :rolescod, fncod = :fncod, fnrolest = :fnrolest, fnexp = :fnexp WHERE rolescod = :rolescod";
        $params = ['rolescod' => $rolescod, 'fncod' => $fncod, 'fnrolest' => $fnrolest, 'fnexp' => $fnexp];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM funciones_roles WHERE rolescod = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteFunciones_roles($id){
	$sqlstr= "DELETE  FROM funciones_roles WHERE rolescod = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}