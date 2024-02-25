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

namespace Dao\Albums;

use Dao\Table;

class Albums extends Table
{

  private $id_album;
  private $title_album;
  private $image_album;
  private $release_date_album;
  private $number_of_songs_album;
  private $id_artist;
  private $status_album;
  private $id_genre;


  public static function getAlbum()
  {
    $sqlstr = "SELECT 
        album.*, 
        artist.*    
   FROM album 
   INNER JOIN artist ON album.id_artist = artist.id_artist ";


    $params = [];
    $registros = self::obtenerRegistros($sqlstr, $params);
    return $registros;
  }

  public static function gettop()
  {
    $sqlstr = "SELECT 
      album.*, 
      artist.*    
 FROM album 
 INNER JOIN artist ON album.id_artist = artist.id_artist LIMIT 5 ";

    $params = [];
    $registros = self::obtenerRegistros($sqlstr, $params);
    return $registros;
  }


  public static function insertAlbum($id_album, $title_album, $image_album, $release_date_album, $number_of_songs_album, $id_artist, $status_album, $id_genre)
  {

    $sqlstr = "INSERT INTO album (id_album, title_album, image_album, release_date_album, number_of_songs_album, id_artist, status_album, id_genre) VALUES (:id_album , :title_album , :image_album , :release_date_album , :number_of_songs_album , :id_artist , :status_album , :id_genre)";
    $params = ['id_album' => $id_album, 'title_album' => $title_album, 'image_album' => $image_album, 'release_date_album' => $release_date_album, 'number_of_songs_album' => $number_of_songs_album, 'id_artist' => $id_artist, 'status_album' => $status_album, 'id_genre' => $id_genre];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;
  }

  public static function updateAlbum($id_album, $title_album, $image_album, $release_date_album, $number_of_songs_album, $id_artist, $status_album, $id_genre)
  {

    $sqlstr = "UPDATE album SET id_album = :id_album, title_album = :title_album, image_album = :image_album, release_date_album = :release_date_album, number_of_songs_album = :number_of_songs_album, id_artist = :id_artist, status_album = :status_album, id_genre = :id_genre WHERE id_album = :id_album";
    $params = ['id_album' => $id_album, 'title_album' => $title_album, 'image_album' => $image_album, 'release_date_album' => $release_date_album, 'number_of_songs_album' => $number_of_songs_album, 'id_artist' => $id_artist, 'status_album' => $status_album, 'id_genre' => $id_genre];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;
  }

  public static function obtenerPorId($id)
  {
    $sqlstr = "SELECT * FROM album WHERE id_album = :id";
    $params = ['id' => $id];
    $registros = self::obtenerUnRegistro($sqlstr, $params);
    return $registros;
  }

  public static function deleteAlbum($id)
  {
    $sqlstr = "DELETE  FROM album WHERE id_album = :id";
    $params = ['id' => $id];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;
  }
  public static function getAlbums(
    string $partialName = "",
    string $orderBy = "",
    bool $orderDescending = false,
    int $page = 0,
    int $itemsPerPage = 10
  ) {
    $sqlstr = "SELECT DISTINCT a.*, ar.name_artist AS artist_name
           FROM album a
           LEFT JOIN artist ar ON a.id_artist = ar.id_artist";

    $sqlstrCount = "SELECT COUNT(Distinct a.id_album) as count
FROM album a
LEFT JOIN artist ar ON a.id_artist = ar.id_artist";
    $conditions = [];
    $params = [];
    if ($partialName != "") {
      $conditions[] = "(a.title_album LIKE :partialName OR ar.name_artist LIKE :partialName)";
      $params["partialName"] = "%" . $partialName . "%";
    }
    if (count($conditions) > 0) {
      $sqlstr .= " WHERE " . implode(" AND ", $conditions);
      $sqlstrCount .= " WHERE " . implode(" AND ", $conditions);
    }
    if (!in_array($orderBy, ["a.id_album", "a.title_album", "a.image", ""])) {
      throw new \Exception("Error Processing Request OrderBy has invalid value");
    }
    if ($orderBy != "") {
      $sqlstr .= " ORDER BY " . $orderBy;
      if ($orderDescending) {
        $sqlstr .= " DESC";
      }
    }
    $numeroDeRegistros = self::obtenerUnRegistro($sqlstrCount, $params)["count"];
    $pagesCount = ceil($numeroDeRegistros / $itemsPerPage);
    if ($page > $pagesCount - 1) {
      $page = $pagesCount - 1;
    }
    $sqlstr .= " LIMIT " . $page * $itemsPerPage . ", " . $itemsPerPage;
    $registros = null;
    try {
      $registros = self::obtenerRegistros($sqlstr, $params);
    } catch (\Exception $e) {
      $registros = self::getAlbums("", "", false, 0, 10)["albums"];
    }
    return ["albums" => $registros, "total" => $numeroDeRegistros, "page" => $page, "itemsPerPage" => $itemsPerPage];
  }
}