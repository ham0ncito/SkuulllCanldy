<?php

namespace Controllers\Funcionesroless;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Funcionesroless\Funcionesroless as DAOFuncionesroles;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Funcionesroles extends PrivateController
{
    private $rolescod;
    private $fncod;
    private $fnrolest;
    private $fnexp;

    public function run(): void
    {
        Site::addLink('funciones_roles_style');
        $viewData['rolescod'] = 'rolescod';
        $viewData['fncod'] = 'fncod';
        $viewData['fnrolest'] = 'fnrolest';
        $viewData['fnexp'] = 'fnexp';
        $viewData['funciones_roles'] = DAOFuncionesroles::getFunciones_roles();
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("funciones_roless/funciones_roleslist", $viewData);
    }
}
