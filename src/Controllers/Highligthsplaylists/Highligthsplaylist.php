<?php
namespace Controllers\Highligthsplaylists;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Highligthsplaylists\Highligthsplaylists as DAOHighligthsplaylist;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Highligthsplaylist extends PublicController {
  private $highligths_id;
  private $playlist_id;
  private $highligths_description;

    public function run(): void
    {
        Site::addLink('highligthsplaylist_style');
        $viewData['highligths_id'] = 'highligths_id';
		$viewData['playlist_id'] = 'playlist_id';
		$viewData['highligths_description'] = 'highligths_description';
		$viewData['highligthsplaylist']= DAOHighligthsplaylist::getHighligthsplaylist();
        Renderer::render("highligthsplaylists/highligthsplaylistlist", $viewData);
    }
}
