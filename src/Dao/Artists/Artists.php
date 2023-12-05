<?php
namespace Dao\Artists; 
use Dao\Table; 
class Artists extends Table{
    
  private $id_artist;
  private $name_artist;
  private $image_artist;
  private $date_of_birth_artist;
  private $country_artist;
  private $status_artist;
  private $artist_bio;

 
  public static function getArtist(){
	 $sqlstr= "SELECT * FROM artist";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

        public static function gettop(){
                $sqlstr= "SELECT * FROM artist Limit 4";
               $params = [];
               $registros = self::obtenerRegistros($sqlstr, $params);
               return $registros;
               }
  public static function insertArtist($id_artist, $name_artist, $image_artist, $date_of_birth_artist, $country_artist, $status_artist, $artist_bio){
	
    $sqlstr = "INSERT INTO artist (id_artist, name_artist, image_artist, date_of_birth_artist, country_artist, status_artist, artist_bio) VALUES (:id_artist , :name_artist , :image_artist , :date_of_birth_artist , :country_artist , :status_artist , :artist_bio)";
    $params = ['id_artist' => $id_artist, 'name_artist' => $name_artist, 'image_artist' => $image_artist, 'date_of_birth_artist' => $date_of_birth_artist, 'country_artist' => $country_artist, 'status_artist' => $status_artist, 'artist_bio' => $artist_bio];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateArtist($id_artist, $name_artist, $image_artist, $date_of_birth_artist, $country_artist, $status_artist, $artist_bio){
	
        $sqlstr = "UPDATE artist SET id_artist = :id_artist, name_artist = :name_artist, image_artist = :image_artist, date_of_birth_artist = :date_of_birth_artist, country_artist = :country_artist, status_artist = :status_artist, artist_bio = :artist_bio WHERE id_artist = :id_artist";
        $params = ['id_artist' => $id_artist, 'name_artist' => $name_artist, 'image_artist' => $image_artist, 'date_of_birth_artist' => $date_of_birth_artist, 'country_artist' => $country_artist, 'status_artist' => $status_artist, 'artist_bio' => $artist_bio];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM artist WHERE id_artist = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteArtist($id){
	$sqlstr= "DELETE  FROM artist WHERE id_artist = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}