<?php
namespace Controllers\Highligthss;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Highligthss\Highligthss as DAOHighligths;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Highligths extends PublicController {
  private $highligths_id;
  private $highligths_starts_at;
  private $highligths_ends_at;
  private $highligths_time;

    public function run(): void
    {
        Site::addLink('highligths_style');
        $viewData['highligths_id'] = 'highligths_id';
		$viewData['highligths_starts_at'] = 'highligths_starts_at';
		$viewData['highligths_ends_at'] = 'highligths_ends_at';
		$viewData['highligths_time'] = 'highligths_time';
		$viewData['highligths']= DAOHighligths::getHighligths();
        Renderer::render("highligthss/highligthslist", $viewData);
    }
}