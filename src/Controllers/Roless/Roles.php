<?php

namespace Controllers\Roless;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Roless\Roless as DAORoles;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Roles extends PrivateController
{
    private $rolescod;
    private $rolesdsc;
    private $rolesest;

    public function run(): void
    {
        Site::addLink('roles_style');
        $viewData['rolescod'] = 'rolescod';
        $viewData['rolesdsc'] = 'rolesdsc';
        $viewData['rolesest'] = 'rolesest';
        $viewData['roles'] = DAORoles::getRoles();
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("roless/roleslist", $viewData);
    }
}
