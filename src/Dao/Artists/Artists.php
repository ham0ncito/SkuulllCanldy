<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
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
    
        public static function getArtists(string $partialName = "",
        string $orderBy = "",
        bool $orderDescending = false,
        int $page = 0,
        int $itemsPerPage = 10){
                $sqlstr = "SELECT * FROM artist a";
              
              
              $sqlstrCount = "SELECT COUNT(*) as count FROM artist a";
              $conditions = [];
              $params = [];
              if ($partialName != "") {
                $conditions[] = "a.name_artist LIKE :partialName";
                $params["partialName"] = "%" . $partialName . "%";
              }
              if (count($conditions) > 0) {
                $sqlstr .= " WHERE " . implode(" AND ", $conditions);
                $sqlstrCount .= " WHERE " . implode(" AND ", $conditions);
              }
              if (!in_array($orderBy, ["a.id_artist", "a.name_artist", "a.image_artist", ""])) {
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
              try{
                $registros = self::obtenerRegistros($sqlstr, $params);
              }catch(\Exception $e){
                $registros = self::getArtists("", "", false, 0, 10)["artists"];
              }
              return ["artists" => $registros, "total" => $numeroDeRegistros, "page" => $page, "itemsPerPage" => $itemsPerPage];
          }
        }