<?php

namespace Controllers\Funcioness;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Funcioness\Funcioness as DAOFunciones;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Funciones extends PrivateController
{
    private $fncod;
    private $fndsc;
    private $fnest;
    private $fntyp;

    public function run(): void
    {
        Site::addLink('funciones_style');
        $viewData['fncod'] = 'fncod';
        $viewData['fndsc'] = 'fndsc';
        $viewData['fnest'] = 'fnest';
        $viewData['fntyp'] = 'fntyp';

        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['funciones'] = DAOFunciones::getFunciones())) {
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
        Renderer::render("funcioness/funcioneslist", $viewData);
    }
}