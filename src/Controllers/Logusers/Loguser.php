<?php
namespace Controllers\Logusers;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Logusers\Logusers as DAOLoguser;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Loguser extends PublicController {
  private $user_cod;
  private $log_cod;
  private $date;

    public function run(): void
    {
        Site::addLink('loguser_style');
        $viewData['user_cod'] = 'user_cod';
		$viewData['log_cod'] = 'log_cod';
		$viewData['date'] = 'date';
		$viewData['loguser']= DAOLoguser::getLoguser();
        Renderer::render("logusers/loguserlist", $viewData);
    }
}
