<?php

namespace Controllers\Favoritess;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Favoritess\Favoritess as DAOFavorites;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Favorites extends PrivateController
{
    private $id_favorite;
    private $usercod;
    private $id_reference;
    private $type_favorite;

    public function run(): void
    {
        Site::addLink('favorites_style');
        $viewData['id_favorite'] = 'id_favorite';
        $viewData['usercod'] = 'usercod';
        $viewData['id_reference'] = 'id_reference';
        $viewData['type_favorite'] = 'type_favorite';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['favorites'] = DAOFavorites::getFavorites())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
            
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("favoritess/favoriteslist", $viewData);
    }
}