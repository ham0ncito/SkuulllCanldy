<?php
namespace Controllers\Songs;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Songs\Songs as DAOSong;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Song extends PublicController {
  private $id_song;
  private $title_song;
  private $duration;
  private $id_genre;
  private $song_cover;
  private $album_id;
  private $status_song;
  private $link_song;

    public function run(): void
    {
        Site::addLink('song_style');
        $viewData['id_song'] = 'id_song';
		$viewData['title_song'] = 'title_song';
		$viewData['duration'] = 'duration';
		$viewData['id_genre'] = 'id_genre';
		$viewData['song_cover'] = 'song_cover';
		$viewData['album_id'] = 'album_id';
		$viewData['status_song'] = 'status_song';
		$viewData['link_song'] = 'link_song';
		$viewData['song']= DAOSong::getSong();
        Renderer::render("songs/songlist", $viewData);
    }
}
