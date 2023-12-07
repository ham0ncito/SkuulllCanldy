<?php

namespace Controllers\Artists;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Artists\Artists as DAOArtist;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Artist extends PrivateController
{
    private $id_artist;
    private $name_artist;
    private $image_artist;
    private $date_of_birth_artist;
    private $country_artist;
    private $status_artist;
    private $artist_bio;

    public function run(): void
    {
        Site::addLink('artist_style');
        $viewData['id_artist'] = 'id_artist';
        $viewData['name_artist'] = 'name_artist';
        $viewData['image_artist'] = 'image_artist';
        $viewData['date_of_birth_artist'] = 'date_of_birth_artist';
        $viewData['country_artist'] = 'country_artist';
        $viewData['status_artist'] = 'status_artist';
        $viewData['artist_bio'] = 'artist_bio';
        $viewData['artist'] = DAOArtist::getArtist();
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("artists/artistlist", $viewData);
    }
}
