<?php
namespace Controllers\Lognonusers;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Lognonusers\Lognonusers as DAOLognonuser;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Lognonuser extends PublicController {
  private $id_logNonUser;
  private $log_date;
  private $id_cookie;
  private $log_cod;

    public function run(): void
    {
        Site::addLink('lognonuser_style');
        $viewData['id_logNonUser'] = 'id_logNonUser';
		$viewData['log_date'] = 'log_date';
		$viewData['id_cookie'] = 'id_cookie';
		$viewData['log_cod'] = 'log_cod';
		$viewData['lognonuser']= DAOLognonuser::getLognonuser();
        Renderer::render("lognonusers/lognonuserlist", $viewData);
    }
}
