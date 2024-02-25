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
namespace Dao\Roless; 
use Dao\Table; 
class Roless extends Table{
    
  private $rolescod;
  private $rolesdsc;
  private $rolesest;

 
  public static function getRoles(){
	 $sqlstr= "SELECT * FROM roles";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertRoles($rolescod, $rolesdsc, $rolesest){
	
    $sqlstr = "INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES (:rolescod , :rolesdsc , :rolesest)";
    $params = ['rolescod' => $rolescod, 'rolesdsc' => $rolesdsc, 'rolesest' => $rolesest];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateRoles($rolescod, $rolesdsc, $rolesest){
	
        $sqlstr = "UPDATE roles SET rolescod = :rolescod, rolesdsc = :rolesdsc, rolesest = :rolesest WHERE rolescod = :rolescod";
        $params = ['rolescod' => $rolescod, 'rolesdsc' => $rolesdsc, 'rolesest' => $rolesest];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM roles WHERE rolescod = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteRoles($id){
	$sqlstr= "DELETE  FROM roles WHERE rolescod = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}