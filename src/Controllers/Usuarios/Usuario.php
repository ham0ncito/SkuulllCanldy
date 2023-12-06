<?php
namespace Controllers\Usuarios;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Usuarios\Usuarios as DAOUsuario;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Usuario extends PrivateController {
  private $usercod;
  private $useremail;
  private $username;
  private $userpswd;
  private $userfching;
  private $userpswdest;
  private $userpswdexp;
  private $userest;
  private $useractcod;
  private $userpswdchg;
  private $usertipo;

    public function run(): void
    {
        Site::addLink('usuario_style');
        $viewData['usercod'] = 'usercod';
		$viewData['useremail'] = 'useremail';
		$viewData['username'] = 'username';
		$viewData['userpswd'] = 'userpswd';
		$viewData['userfching'] = 'userfching';
		$viewData['userpswdest'] = 'userpswdest';
		$viewData['userpswdexp'] = 'userpswdexp';
		$viewData['userest'] = 'userest';
		$viewData['useractcod'] = 'useractcod';
		$viewData['userpswdchg'] = 'userpswdchg';
		$viewData['usertipo'] = 'usertipo';
		$viewData['usuario']= DAOUsuario::getUsuario();
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 
        Renderer::render("usuarios/usuariolist", $viewData);
    }
}