<?php
namespace Dao\Albums; 
use Dao\Table; 
class Albums extends Table{
    
  private $id_album;
  private $title_album;
  private $image_album;
  private $release_date_album;
  private $number_of_songs_album;
  private $id_artist;
  private $status_album;
  private $id_genre;

 
  public static function getAlbum(){
        $sqlstr = "SELECT 
        album.*, 
        artist.*    
   FROM album 
   INNER JOIN artist ON album.id_artist = artist.id_artist ";


        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
    }
    

  public static function insertAlbum($id_album, $title_album, $image_album, $release_date_album, $number_of_songs_album, $id_artist, $status_album, $id_genre){
	
    $sqlstr = "INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES (:id_album , :title_album , :image_album , :release_date_album , :number_of_songs_album , :id_artist , :status_album , :id_genre)";
    $params = ['id_album' => $id_album, 'title_album' => $title_album, 'image_album' => $image_album, 'release_date_album' => $release_date_album, 'number_of_songs_album' => $number_of_songs_album, 'id_artist' => $id_artist, 'status_album' => $status_album, 'id_genre' => $id_genre];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateAlbum($id_album, $title_album, $image_album, $release_date_album, $number_of_songs_album, $id_artist, $status_album, $id_genre){
	
        $sqlstr = "UPDATE album SET id_album = :id_album, title_album = :title_album, image_album = :image_album, release_date_album = :release_date_album, number_of_songs_album = :number_of_songs_album, id_artist = :id_artist, status_album = :status_album, id_genre = :id_genre WHERE id_album = :id_album";
        $params = ['id_album' => $id_album, 'title_album' => $title_album, 'image_album' => $image_album, 'release_date_album' => $release_date_album, 'number_of_songs_album' => $number_of_songs_album, 'id_artist' => $id_artist, 'status_album' => $status_album, 'id_genre' => $id_genre];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM album WHERE id_album = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteAlbum($id){
	$sqlstr= "DELETE  FROM album WHERE id_album = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}