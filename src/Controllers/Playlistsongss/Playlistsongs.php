<?php

namespace Controllers\Playlistsongss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Playlistsongss\Playlistsongss as DAOPlaylistsongs;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Playlistsongs extends PrivateController
{
    private $playlist_id;
    private $song_id;
    private $playlistSong_added_at;
    private $playlistSong_status;

    public function run(): void
    {
        Site::addLink('playlistsongs_style');
        $viewData['playlist_id'] = 'playlist_id';
        $viewData['song_id'] = 'song_id';
        $viewData['playlistSong_added_at'] = 'playlistSong_added_at';
        $viewData['playlistSong_status'] = 'playlistSong_status';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['playlistsongs'] = DAOPlaylistsongs::getPlaylistsongs())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
        }


        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("playlistsongss/playlistsongslist", $viewData);
    }
}