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
  public static function getSongs(
      string $partialName = "",
      string $orderBy = "",
      bool $orderDescending = false,
      int $page = 0,
      int $itemsPerPage = 10
  ){
    $sqlstr = "SELECT DISTINCT s.*, ar.name_artist,a.title_album,a.release_date_album,ROW_NUMBER() OVER (ORDER BY s.id_song) AS row_number
    FROM song s
    JOIN album a ON s.album_id = a.id_album
    JOIN artist ar ON a.id_artist = ar.id_artist";

$sqlstrCount = "SELECT COUNT(DISTINCT s.id_song) as count
    FROM song s
    JOIN album a ON s.album_id = a.id_album
    JOIN artist ar ON a.id_artist = ar.id_artist";

$conditions = [];
$params = [];

if ($partialName != "") {
    $conditions[] = "(s.title_song LIKE :partialName OR ar.name_artist LIKE :partialName)";
    $params["partialName"] = "%" . $partialName . "%";
}

if (count($conditions) > 0) {
    $sqlstr .= " WHERE " . implode(" AND ", $conditions);
    $sqlstrCount .= " WHERE " . implode(" AND ", $conditions);
}

if (!in_array($orderBy, ["s.id_song", "s.title_song", "s.duration", ""])) {
    throw new \Exception("Error Processing Request OrderBy has an invalid value");
}

if ($orderBy != "") {
    $sqlstr .= " ORDER BY " . $orderBy;
    if ($orderDescending) {
        $sqlstr .= " DESC";
    }
}
    $sqlstr .= " LIMIT " . $page * $itemsPerPage . ", " . $itemsPerPage;

    $numeroDeRegistros = self::obtenerUnRegistro($sqlstrCount, $params)["count"];
    $pagesCount = ceil($numeroDeRegistros / $itemsPerPage);

    if ($page > $pagesCount - 1) {
      $page = $pagesCount - 1;
    }

    
    $registros = null;

    try {
      $registros = self::obtenerRegistros($sqlstr, $params);
    } catch (\Exception $e) {
      $registros = self::getSongs("", "", false, 0, 10)["songs"];
    }
    if(empty($registros)){
      $registros = self::getSongs("", "", false, 0, 10)["songs"];
    }
    return ["songs" => $registros, "total" => $numeroDeRegistros, "page" => $page, "itemsPerPage" => $itemsPerPage];
  }
    
}