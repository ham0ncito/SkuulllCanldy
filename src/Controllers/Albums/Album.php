<?php

namespace Controllers\Albums;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Albums\Albums as DAOAlbum;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Album extends PrivateController
{
    private $id_album;
    private $title_album;
    private $image_album;
    private $release_date_album;
    private $number_of_songs_album;
    private $id_artist;
    private $status_album;
    private $id_genre;

    public function run(): void
    {
        Site::addLink('album_style');
        $viewData['id_album'] = 'id_album';
        $viewData['title_album'] = 'title_album';
        $viewData['image_album'] = 'image_album';
        $viewData['release_date_album'] = 'release_date_album';
        $viewData['number_of_songs_album'] = 'number_of_songs_album';
        $viewData['id_artist'] = 'id_artist';
        $viewData['status_album'] = 'status_album';
        $viewData['id_genre'] = 'id_genre';


        if (\Utilities\Functions::isAnEmptyArray($viewData['album'] = DAOAlbum::getAlbum())) {
            $viewData['isEmpty'] = True;
        } {
            $viewData['isEmpty'] = false;
        }

        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("albums/albumlist", $viewData);
    }
}