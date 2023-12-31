<?php

namespace Controllers\Carretillas;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Carretillas\Carretillas as DAOCarretilla;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Carretilla extends PrivateController
{
    private $usercod;
    private $productId;
    private $crrctd;
    private $crrprc;
    private $crrfching;

    public function run(): void
    {
        Site::addLink('carretilla_style');
        $viewData['usercod'] = 'usercod';
        $viewData['productId'] = 'productId';
        $viewData['crrctd'] = 'crrctd';
        $viewData['crrprc'] = 'crrprc';
        $viewData['crrfching'] = 'crrfching';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['carretilla'] = DAOCarretilla::getCarretilla())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("carretillas/carretillalist", $viewData);
    }
}