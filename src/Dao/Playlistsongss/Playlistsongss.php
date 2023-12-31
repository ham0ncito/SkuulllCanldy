<?php
namespace Dao\Playlistsongss; 
use Dao\Table; 
class Playlistsongss extends Table{
      private $playlist_id;
  private $song_id;
  private $playlistSong_added_at;
  private $playlistSong_status;

 
  public static function getPlaylistsongs(){
	 $sqlstr= "SELECT * FROM playlistsongs";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
	}

  public static function insertPlaylistsongs($playlist_id, $song_id, $playlistSong_added_at, $playlistSong_status){
	
    $sqlstr = "INSERT INTO playlistsongs (playlist_id, song_id, playlistSong_added_at, playlistSong_status) VALUES (:playlist_id , :song_id , :playlistSong_added_at , :playlistSong_status)";
    $params = ['playlist_id' => $playlist_id, 'song_id' => $song_id, 'playlistSong_added_at' => $playlistSong_added_at, 'playlistSong_status' => $playlistSong_status];
    $registros = self::executeNonQuery($sqlstr, $params);
    return $registros;

	}

  public static function updatePlaylistsongs($playlist_id, $song_id, $playlistSong_added_at, $playlistSong_status){
	
        $sqlstr = "UPDATE playlistsongs SET playlist_id = :playlist_id, song_id = :song_id, playlistSong_added_at = :playlistSong_added_at, playlistSong_status = :playlistSong_status WHERE playlist_id = :playlist_id";
        $params = ['playlist_id' => $playlist_id, 'song_id' => $song_id, 'playlistSong_added_at' => $playlistSong_added_at, 'playlistSong_status' => $playlistSong_status];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

 public static function obtenerPorId($id){
	 $sqlstr= "SELECT * FROM playlistsongs WHERE playlist_id = :id";
        $params = ['id'=>$id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
	}

 public static function deletePlaylistsongs($id){
	$sqlstr= "DELETE  FROM playlistsongs WHERE playlist_id = :id";
        $params = ['id'=>$id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
	}
    
}