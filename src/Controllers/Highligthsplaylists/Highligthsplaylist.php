<?php

namespace Controllers\Highligthsplaylists;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Highligthsplaylists\Highligthsplaylists as DAOHighligthsplaylist;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Highligthsplaylist extends PrivateController
{
    private $highligths_id;
    private $playlist_id;
    private $highligths_description;

    public function run(): void
    {
        Site::addLink('highligthsplaylist_style');
        $viewData['highligths_id'] = 'highligths_id';
        $viewData['playlist_id'] = 'playlist_id';
        $viewData['highligths_description'] = 'highligths_description';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['highligthsplaylist'] = DAOHighligthsplaylist::getHighligthsplaylist())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
        }

        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("highligthsplaylists/highligthsplaylistlist", $viewData);
    }
}