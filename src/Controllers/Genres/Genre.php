<?php

namespace Controllers\Genres;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Genres\Genres as DAOGenre;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Genre extends PrivateController
{
    private $id_genre;
    private $name_genre;
    private $description_genre;
    private $status_genre;
    private $image_genre;

    public function run(): void
    {
        Site::addLink('genre_style');
        $viewData['id_genre'] = 'id_genre';
        $viewData['name_genre'] = 'name_genre';
        $viewData['description_genre'] = 'description_genre';
        $viewData['status_genre'] = 'status_genre';
        $viewData['image_genre'] = 'image_genre';
        if (\Utilities\Functions::isAnEmptyArray($viewData['genre'] = DAOGenre::getGenre())) {
            $viewData['isEmpty'] = true;
        } else {
            $viewData['isEmpty'] = false;
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("genres/genrelist", $viewData);
    }
}