<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
namespace Dao\Genres; 
use Dao\Table; 
class Genres extends Table{
    
  private $id_genre;
  private $name_genre;
  private $description_genre;
  private $status_genre;
  private $image_genre;

 
  public static function getGenre(){
	 $sqlstr= "SELECT * FROM genre";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertGenre($id_genre, $name_genre, $description_genre, $status_genre, $image_genre){
	
    $sqlstr = "INSERT INTO genre (id_genre, name_genre, description_genre, status_genre, image_genre) VALUES (:id_genre , :name_genre , :description_genre , :status_genre , :image_genre)";
    $params = ['id_genre' => $id_genre, 'name_genre' => $name_genre, 'description_genre' => $description_genre, 'status_genre' => $status_genre, 'image_genre' => $image_genre];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateGenre($id_genre, $name_genre, $description_genre, $status_genre, $image_genre){
	
        $sqlstr = "UPDATE genre SET id_genre = :id_genre, name_genre = :name_genre, description_genre = :description_genre, status_genre = :status_genre, image_genre = :image_genre WHERE id_genre = :id_genre";
        $params = ['id_genre' => $id_genre, 'name_genre' => $name_genre, 'description_genre' => $description_genre, 'status_genre' => $status_genre, 'image_genre' => $image_genre];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM genre WHERE id_genre = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteGenre($id_genre){
	$sqlstr= "DELETE FROM genre WHERE id_genre = :id_genre";
        $params = ['id_genre'=>$id_genre];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}