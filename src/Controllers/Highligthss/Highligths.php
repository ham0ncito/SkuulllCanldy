<?php

namespace Controllers\Highligthss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Highligthss\Highligthss as DAOHighligths;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Highligths extends PrivateController
{
    private $highligths_id;
    private $highligths_starts_at;
    private $highligths_ends_at;
    private $highligths_time;

    public function run(): void
    {
        Site::addLink('highligths_style');
        $viewData['highligths_id'] = 'highligths_id';
        $viewData['highligths_starts_at'] = 'highligths_starts_at';
        $viewData['highligths_ends_at'] = 'highligths_ends_at';
        $viewData['highligths_time'] = 'highligths_time';
        $viewData['highligths'] = DAOHighligths::getHighligths();
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("highligthss/highligthslist", $viewData);
    }
}