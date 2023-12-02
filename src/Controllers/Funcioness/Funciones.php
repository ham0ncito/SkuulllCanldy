<?php
namespace Controllers\Funcioness;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Funcioness\Funcioness as DAOFunciones;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Funciones extends PrivateController {
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
		$viewData['funciones']= DAOFunciones::getFunciones();
        Renderer::render("funcioness/funcioneslist", $viewData);
    }
}