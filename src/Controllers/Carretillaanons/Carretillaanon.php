<?php

namespace Controllers\Carretillaanons;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Carretillaanons\Carretillaanons as DAOCarretillaanon;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Carretillaanon extends PrivateController
{
    private $anoncod;
    private $productId;
    private $crrctd;
    private $crrprc;
    private $crrfching;

    public function run(): void
    {
        Site::addLink('carretillaanon_style');
        $viewData['anoncod'] = 'anoncod';
        $viewData['productId'] = 'productId';
        $viewData['crrctd'] = 'crrctd';
        $viewData['crrprc'] = 'crrprc';
        $viewData['crrfching'] = 'crrfching';
        $viewData['carretillaanon'] = DAOCarretillaanon::getCarretillaanon();

        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['carretillaanon'] = DAOCarretillaanon::getCarretillaanon())) {
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
        Renderer::render("carretillaanons/carretillaanonlist", $viewData);
    }
}