<?php
namespace Controllers\Songauthorss;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Songauthorss\Songauthorss as DAOSongauthors;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Songauthors extends PrivateController {
  private $artist_id;
  private $song_id;
  private $song_author_created_at;
  private $song_author_last_update_at;

    public function run(): void
    {
        Site::addLink('songauthors_style');
        $viewData['artist_id'] = 'artist_id';
		$viewData['song_id'] = 'song_id';
		$viewData['song_author_created_at'] = 'song_author_created_at';
		$viewData['song_author_last_update_at'] = 'song_author_last_update_at';
		$viewData['songauthors']= DAOSongauthors::getSongauthors();
        Renderer::render("songauthorss/songauthorslist", $viewData);
    }
}