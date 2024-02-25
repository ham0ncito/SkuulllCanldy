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
namespace Dao\Rolesusuarioss; 
use Dao\Table; 
class Rolesusuarioss extends Table{
    
  private $usercod;
  private $rolescod;
  private $roleuserest;
  private $roleuserfch;
  private $roleuserexp;

 
  public static function getRoles_usuarios(){
	 $sqlstr= "SELECT * FROM roles_usuarios";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertRoles_usuarios($usercod, $rolescod, $roleuserest, $roleuserfch, $roleuserexp){
	
    $sqlstr = "INSERT INTO roles_usuarios (usercod, rolescod, roleuserest, roleuserfch, roleuserexp) VALUES (:usercod , :rolescod , :roleuserest , :roleuserfch , :roleuserexp)";
    $params = ['usercod' => $usercod, 'rolescod' => $rolescod, 'roleuserest' => $roleuserest, 'roleuserfch' => $roleuserfch, 'roleuserexp' => $roleuserexp];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateRoles_usuarios($usercod, $rolescod, $roleuserest, $roleuserfch, $roleuserexp){
	
        $sqlstr = "UPDATE roles_usuarios SET usercod = :usercod, rolescod = :rolescod, roleuserest = :roleuserest, roleuserfch = :roleuserfch, roleuserexp = :roleuserexp WHERE usercod = :usercod";
        $params = ['usercod' => $usercod, 'rolescod' => $rolescod, 'roleuserest' => $roleuserest, 'roleuserfch' => $roleuserfch, 'roleuserexp' => $roleuserexp];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM roles_usuarios WHERE usercod = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteRoles_usuarios($id){
	$sqlstr= "DELETE  FROM roles_usuarios WHERE usercod = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}