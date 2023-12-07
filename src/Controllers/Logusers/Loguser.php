<?php

namespace Controllers\Logusers;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Logusers\Logusers as DAOLoguser;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Loguser extends PrivateController
{
    private $user_cod;
    private $log_cod;
    private $date;

    public function run(): void
    {
        Site::addLink('loguser_style');
        $viewData['user_cod'] = 'user_cod';
        $viewData['log_cod'] = 'log_cod';
        $viewData['date'] = 'date';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['loguser'] = DAOLoguser::getLoguser())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
        }

        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("logusers/loguserlist", $viewData);
    }
}