<?php
namespace Controllers\Logs;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Logs\Logs as DAOLog;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Log extends PublicController {
  private $log_cod;
  private $log_description;

    public function run(): void
    {
        Site::addLink('log_style');
        $viewData['log_cod'] = 'log_cod';
		$viewData['log_description'] = 'log_description';
		$viewData['log']= DAOLog::getLog();
        Renderer::render("logs/loglist", $viewData);
    }
}
