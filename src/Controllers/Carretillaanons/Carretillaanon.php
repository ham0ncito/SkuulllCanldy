<?php
namespace Controllers\Carretillaanons;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Carretillaanons\Carretillaanons as DAOCarretillaanon;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Carretillaanon extends PublicController {
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
		$viewData['carretillaanon']= DAOCarretillaanon::getCarretillaanon();
        Renderer::render("carretillaanons/carretillaanonlist", $viewData);
    }
}
