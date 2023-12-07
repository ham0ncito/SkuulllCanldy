<?php

namespace Controllers\Logs;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Logs\Logs as DAOLog;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Log extends PrivateController
{
    private $log_cod;
    private $log_description;

    public function run(): void
    {
        Site::addLink('log_style');
        $viewData['log_cod'] = 'log_cod';
        $viewData['log_description'] = 'log_description';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['log'] = DAOLog::getLog())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("logs/loglist", $viewData);
    }
}