<?php
namespace Dao\Songs; 
use Dao\Table; 
class Songs extends Table{
    
  private $id_song;
  private $title_song;
  private $duration;
  private $id_genre;
  private $song_cover;
  private $album_id;
  private $status_song;
  private $link_song;

 
  public static function getSong(){
     
	$sqlstr = "SELECT song.*, album.*, artist.* 
           FROM song 
           INNER JOIN album ON song.album_id = album.id_album 
           INNER JOIN artist ON album.id_artist = artist.id_artist";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}
  public static function getTop(){
     
    $sqlstr = "SELECT song.*, album.*, artist.* 
             FROM song 
             INNER JOIN album ON song.album_id = album.id_album 
             INNER JOIN artist ON album.id_artist = artist.id_artist LIMIT 5";
          $params = [];
          $registros = self::obtenerRegistros($sqlstr, $params);
          return $registros;
    }

  public static function insertSong($id_song, $title_song, $duration, $id_genre, $song_cover, $album_id, $status_song, $link_song){
	
    $sqlstr = "INSERT INTO song (id_song, title_song, duration, id_genre, song_cover, album_id, status_song, link_song) VALUES (:id_song , :title_song , :duration , :id_genre , :song_cover , :album_id , :status_song , :link_song)";
    $params = ['id_song' => $id_song, 'title_song' => $title_song, 'duration' => $duration, 'id_genre' => $id_genre, 'song_cover' => $song_cover, 'album_id' => $album_id, 'status_song' => $status_song, 'link_song' => $link_song];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updateSong($id_song, $title_song, $duration, $id_genre, $song_cover, $album_id, $status_song, $link_song){
	
        $sqlstr = "UPDATE song SET id_song = :id_song, title_song = :title_song, duration = :duration, id_genre = :id_genre, song_cover = :song_cover, album_id = :album_id, status_song = :status_song, link_song = :link_song WHERE id_song = :id_song";
        $params = ['id_song' => $id_song, 'title_song' => $title_song, 'duration' => $duration, 'id_genre' => $id_genre, 'song_cover' => $song_cover, 'album_id' => $album_id, 'status_song' => $status_song, 'link_song' => $link_song];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM song WHERE id_song = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deleteSong($id){
	$sqlstr= "DELETE  FROM song WHERE id_song = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}