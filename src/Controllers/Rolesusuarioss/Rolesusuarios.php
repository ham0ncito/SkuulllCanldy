<?php
namespace Controllers\Rolesusuarioss;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Rolesusuarioss\Rolesusuarioss as DAORoles_usuarios;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Rolesusuarios extends PrivateController {
  private $usercod;
  private $rolescod;
  private $roleuserest;
  private $roleuserfch;
  private $roleuserexp;

    public function run(): void
    {
        Site::addLink('roles_usuarios_style');
        $viewData['usercod'] = 'usercod';
		$viewData['rolescod'] = 'rolescod';
		$viewData['roleuserest'] = 'roleuserest';
		$viewData['roleuserfch'] = 'roleuserfch';
		$viewData['roleuserexp'] = 'roleuserexp';
		$viewData['roles_usuarios']= DAORoles_usuarios::getRoles_usuarios();
        Renderer::render("roles_usuarioss/roles_usuarioslist", $viewData);
    }
}