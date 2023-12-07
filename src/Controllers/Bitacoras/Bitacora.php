<?php

namespace Controllers\Bitacoras;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Bitacoras\Bitacoras as DAOBitacora;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Bitacora extends PrivateController
{
    private $bitacoracod;
    private $bitacorafch;
    private $bitprograma;
    private $bitdescripcion;
    private $bitobservacion;
    private $bitTipo;
    private $bitusuario;

    public function run(): void
    {
        Site::addLink('bitacora_style');
        $viewData['bitacoracod'] = 'bitacoracod';
        $viewData['bitacorafch'] = 'bitacorafch';
        $viewData['bitprograma'] = 'bitprograma';
        $viewData['bitdescripcion'] = 'bitdescripcion';
        $viewData['bitobservacion'] = 'bitobservacion';
        $viewData['bitTipo'] = 'bitTipo';
        $viewData['bitusuario'] = 'bitusuario';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['bitacora'] = DAOBitacora::getBitacora())) {
                $viewData['isEmpty'] = True;
            }else{
                $viewData['isEmpty'] = false;  
            }
        } else {}
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("bitacoras/bitacoralist", $viewData);
    }
}