<?php

namespace Controllers\Lognonusers;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Lognonusers\Lognonusers as DAOLognonuser;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Lognonuser extends PrivateController
{
    private $id_logNonUser;
    private $log_date;
    private $id_cookie;
    private $log_cod;

    public function run(): void
    {
        Site::addLink('lognonuser_style');
        $viewData['id_logNonUser'] = 'id_logNonUser';
        $viewData['log_date'] = 'log_date';
        $viewData['id_cookie'] = 'id_cookie';
        $viewData['log_cod'] = 'log_cod';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['lognonuser'] = DAOLognonuser::getLognonuser())) {
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
        Renderer::render("lognonusers/lognonuserlist", $viewData);
    }
}